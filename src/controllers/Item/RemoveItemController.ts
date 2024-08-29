import { Request, Response } from "express";
import { RemoveItemService } from "../../services/item/RemoveItemService";

class RemoveItemController {
  async handle(req: Request, res: Response) {
    const item_id = req.body.item_id as string;

    console.log("item_id", item_id);

    const revoveItem = new RemoveItemService();

    const item = await revoveItem.execute({
      item_id,
    });

    return res.json(item);
  }
}

export { RemoveItemController };
