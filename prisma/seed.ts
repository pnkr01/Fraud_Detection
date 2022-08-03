import { PrismaClient, Prisma } from "@prisma/client";

const prisma = new PrismaClient();

const products: Prisma.ProductCreateManyInput[] = [
  {
    name: "Apple iPhone 13",
    price: 499,
    description:
      " <p>Every iPhone you buy from us is unlocked. Your new iPhone will work with your network provider, so you won’t have to change your plan or phone number. Once your new iPhone is activated, it remains unlocked, which means that at any time you can decide to switch to any network that provides service for iPhone.</p>",
    images: [
      "https://m.media-amazon.com/images/I/71GLMJ7TQiL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61NTwRtdzfL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81edi2EvglL._SX679_.jpg",
    ],
    rating: 5,
  },
  {
    name: "OnePlus Nord CE 2 5G (Bahamas Blue, 8GB RAM, 128GB Storage)",
    price: 234,
    description: "",
    images: ["https://m.media-amazon.com/images/I/61+Q6Rh3OQL._SX679_.jpg"],
    rating: 5,
  },
  {
    name: "Samsung Galaxy M13 (Midnight Blue, 4GB, 64GB Storage) | 6000mAh Battery | Upto 8GB RAM with RAM Plus",
    price: 120,
    description: "",
    images: ["https://m.media-amazon.com/images/I/812YsUxpyfL._SX679_.jpg"],
    rating: 3,
  },
  {
    name: "Samsung Galaxy M53 5G (Mystique Green, 6GB, 128GB Storage) | 108MP | sAmoled+ 120Hz | 12GB RAM with RAM Plus",
    price: 250,
    description: "",
    images: ["https://m.media-amazon.com/images/I/810Rscvmd4L._SX679_.jpg"],
    rating: 4,
  },
  {
    name: "OPPO F21 Pro 5G (Rainbow Spectrum, 8GB RAM, 128 Storage) with No Cost EMI/Additional Exchange Offers",
    price: 260,
    description: "",
    images: ["https://m.media-amazon.com/images/I/71XcMiRMC1L._SX679_.jpg"],
    rating: 4,
  },
];

async function main() {
  console.log(`Start seeding ...`);
  for (const product of products) {
    const p = await prisma.product.create({
      data: product,
    });
    console.log(`Created product with id: ${p.id}`);
  }
  console.log(`Seeding finished.`);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
