import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        elevation: 7,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                ),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  onPressed: () => deleteTx(transaction.id),
                  icon: const Icon(Icons.delete),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Theme.of(context).errorColor),
                    overlayColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 239, 195, 192)),
                  ),
                  label: const Text('Delete'))
              : IconButton(
                  splashColor: const Color.fromARGB(255, 239, 195, 192),
                  onPressed: () => deleteTx(transaction.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )),
        ),
      ),
    );
  }
}
