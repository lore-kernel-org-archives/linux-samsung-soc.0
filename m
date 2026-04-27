Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7D302753;
	Mon, 27 Apr 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300555; cv=none; b=d/Md2HW9fZU/N2vSHVS5I8qyDKR3nRp/valcuvp9CCVxwTwPqm/AiwJgYKJXnhkFT7tPY3oXD32uqm1uG5PLMU/GmIpz21mqe8NZeoqzvlJ1xsN7eZSrlwA9KBwgyUESrXhkG4buqjrsXs1j5+Ozpmrzbs0JwQJ7w+wylncp9ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300555; c=relaxed/simple;
	bh=SiWkbnIH8UOAciAE8X5BeZ7KOGlhjwpjAZNRV7KHgWA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BNi3yy2U+B8j3T1gQWOl5XLTQmeAqQB0VAkmZ7gnNZJpa04BoA5MTTU1g6w9+HE8ivQyj1hIq2ZG8N30LSQylKADo09LmemIgt35/3Eh80IdAVm3Evj83ihrnbb07ZaEoQfAlAjN7JMCno4BxvwTXEqBt8mOscU8zpsQ/3M3e68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQRGkxOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQRGkxOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656BDC19425;
	Mon, 27 Apr 2026 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300554;
	bh=SiWkbnIH8UOAciAE8X5BeZ7KOGlhjwpjAZNRV7KHgWA=;
	h=From:To:Cc:Subject:Date:From;
	b=LQRGkxOMUS0qZpvN59yIIWKUCjorLizUI+LomxDIWqm9JrYi4NelOOwOVw6zB1d4B
	 iAY++yUa34htxh4vcPIaWctFA4HzR9fK5L5JdC2yshYLddYoIsK3wSWmna4SHf9bXu
	 d/tuKNDGN5AMQy7/tK6hcVQvLrq3wWgexHNJiOmrKnc8R//HHGX13aYfRFVXFnOaj6
	 oEJ5WBSiSanifLQeEWdNrSdyTf+hCtVutLc1XbwonnqpwaFxiDCdhWZEmAMr6iTCM8
	 acuzT4MpEbpubEyAzv9F+mFS5ICyS1R2nEA29RsdcOU/TjdL+31EiYXrydhrP97d7a
	 RRDWsauvhaW+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Date: Mon, 27 Apr 2026 16:35:27 +0200
Message-Id: <20260427143546.3098519-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/mach-crag6410.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 7def8824bbc5..57176719d8a6 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -779,46 +779,53 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 static const struct gpio_led gpio_leds[] = {
 	{
 		.name = "d13:green:",
-		.gpio = MMGPIO_GPIO_BASE + 0,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d14:green:",
-		.gpio = MMGPIO_GPIO_BASE + 1,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d15:green:",
-		.gpio = MMGPIO_GPIO_BASE + 2,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d16:green:",
-		.gpio = MMGPIO_GPIO_BASE + 3,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d17:green:",
-		.gpio = MMGPIO_GPIO_BASE + 4,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d18:green:",
-		.gpio = MMGPIO_GPIO_BASE + 5,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d19:green:",
-		.gpio = MMGPIO_GPIO_BASE + 6,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d20:green:",
-		.gpio = MMGPIO_GPIO_BASE + 7,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 };
 
+static struct gpiod_lookup_table crag_leds_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static const struct gpio_led_platform_data gpio_leds_pdata = {
 	.leds = gpio_leds,
 	.num_leds = ARRAY_SIZE(gpio_leds),
@@ -875,6 +882,7 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
+	gpiod_add_lookup_table(&crag_leds_table);
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 
 	regulator_has_full_constraints();
-- 
2.39.5

