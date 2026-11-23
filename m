Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432740;
	b=4/VEH8yfuuaSLz681fgao7iX8icq8X0Kxf9EAxeyRtFgFaZl4uh9RhNhgMf0JMqExkMY
	 rk42dhmrp2NeLzV+KOVwvw6YX8nKXnx+YIIL4EPq8mtYJp/KmGBWDoMCA9nuU5RHNTbr/
	 VIaFN6nrlo4Efsz8P4VIDqxDJYRKce5MQp6B3ig+shtFPO3ut26jIrCVE6qDxK1DfE1Ju
	 HHlF2v+ou5DPC5t1uQvRDKgtf7PL8xE+W3lwTAzMrpd1eoBADeXHTXdg7CqE/Ci9mfJi/
	 4V3yffb9N0fv7rqqVPz5W6U4QVPQSVG8GOhdR1SjB4pyVEdcGNw2ai/8KZQ+FJG8edg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=+Bs54xR6o3UqWiUDInUdo2zlGVoF05rGerpAXaT2LIg=;
	b=Q8nHrlUiE8XHLOfP+RuL6TXyKm7vB1lOk7qW4fUA6JnadMKpRkYBkhet84gOJnLPm7DU
	 MvkaJl3rWktbX80eQ3qLYlzkbXMiYJcErgcAcSOygtStL2/nbpyUEUvpkPdT0yjN3KjXY
	 88rl5EhljANw041ZRcXaWCDazkdUTKN1aYTfIav25Dn1+g55LKpH3d+ExviGpjerZksdp
	 5fT9H3VHz1q7r152TdUrOQlD3Qb50JNTMwawxdXHX9y4cliQAkKdROIFCU/lT81wHLjSn
	 1nEq+4qw8ZibwZ0UiGs18tmpzenStw+6BPsQolPokJeOo12G6WEsxeKsaqStjKsLZxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hR2dGhuN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA780606A337
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 11:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA780606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hR2dGhuN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so29107395e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432738; x=1796037538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bs54xR6o3UqWiUDInUdo2zlGVoF05rGerpAXaT2LIg=;
        b=hR2dGhuNyxswcDzcdX2ugBIYZrkxu7gRjZIBSfOOJ7/HDxQburGWyr91zQHPjvrSMq
         ilxQAXa3VRS7IhmlXRvRn/hHig+EoNYz0LVQtrciODrOsrmpa/iPEpUTDVVxykQXFjpF
         TxxPHWn+KFP226vGws3ADxhKVPomkAys202l91zVFIv7EUPtbt1dfsM5KlYvt49T9aWe
         A6pMsJt8ArXTopU9d0KIuG3yZeT6tCE4csAT4yok9phPhklcEnXY9dx0I0A2ftJn8dob
         plBl3cLYaTU+wJWi0Rzc5G18vT83Ye5hoj48B2gU0MFombYYakd2WKcRuVXoKQTk6saZ
         PC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432738; x=1796037538;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Bs54xR6o3UqWiUDInUdo2zlGVoF05rGerpAXaT2LIg=;
        b=MEYAW1BnzWqLsprn+xXH3zLsuxmPZZqTK1kW+nXmvwv1mOvUDIIbm78rWc8KNj1V6f
         ZLit9hUlFq7v0KvUkIlxakPKvn1On34Tv50doHDZYtcxoS2dnq7zYwbYxV7LSlaFP4tZ
         K/tHA1WqlduENOt1p40pIdsOw0NuLQquDICjRT7VdBpgewjA22aST9eoi9z92hfJDoxv
         G31sRrX8QHEfcriP2hQ+6UO3xV086n39jtEO5sre15cqSVQxgzx2xmo38329A2tprHXO
         GEVOyabS9HwSET0Oxl6bCkA0A/GXvO5veH3fHPvVqvaO2d9MGTpk7pwGol8DMj7uO+Zi
         XXJg==
X-Forwarded-Encrypted: i=1; AL+hErHsjcc7bUuC57KsTMdY/S7U8P6uIde3HTeoOatKmo3BpXpT9GEWCdzXXgkwcjCgPfijuhphKd6gnE1xHHEymy/vTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+X9uzIQDRqyFU+aJgDQ2e4R3HO1wiKccYd+8UQ4Oc51rdeGyco
	jsOn6ZAeEmsHc3QwQZbAsgUM92y66xJsQ2XghWgPvZhKXaFkg59ufz7kGlaAJ2QvUJY=
X-Gm-Gg: AZFdTZcL1pSIVlSzvCq/Z3ML/yHZCvL9ZvoEtUtMlwYWop1d/L0a9rBc5rS7HhwGWqH
	yMM+8lcbWLTQrkaCOyZJaoLfhKhq7njiIUrUFkTAkR5HUiQ91CcbkDvFt18A++naJwpeWcbKn5I
	bKAtNAaCtQU0sAiPKoxYAvQX9YY8lxjOyHme1emops1Dk/lBymhtf1Ltee+DCYskUR56F4KwBFI
	7o84iNvubFKCNkxxIVVRJ20Gnp44dk8twkJOrAOKf5g+ezZGjCLhrzmawdzuhz7yN6LnnDOW74z
	M2XDclyJ9TQGn/uaCrTtvMz4yoCLfEFZI54aI6JGJrq4Zu7k6/TEpNoD+yBkPBNOtMMsUQVzLrS
	ZAJiZ1nEcJ9o2svolTdSXxhHHl0K85XQcKpdbG8aHG2COxu/990OjGNT8QfNgbpjuy5qD+ADeOs
	YV0JgfG6MSpXaOp3nfRj6D7UONL9HLNa0D8LclkmC36Kie+53lCLxrOtUpEroFwaeGOGtdpl+nO
	pCzam+d1UY6nVM+4wJ0K1rY4SSaei2BN6sJ3TOUuUhsdkeIqtj3zn5Tfun1ANCknCdZJavN+3nZ
	eDquwl6wZmx7W9nr03KRld21Y5vD8u27J6K/ooVlZgemJrUub3bkXI6N91ulBjchUbA3DK24DtD
	gdF/cl8B//P0DnX/2yIB9aEU/+Cztl9UQ+mwDAA==
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr201826735e9.33.1795432737768;
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b7515sm470106375e9.13.2026.11.23.03.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux@ew.tq-group.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v5 00/17] mfd: Use named initializers for arrays of *_device_data
Date: Mon, 23 Nov 2026 12:17:58 +0100
Message-ID: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9551; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MGKcHdGed8cdYxfcD47xvikCz5El7VhAAvZbGXZ0H80=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDmLnAVuv90OgAYSoKkCYiFYXMo4ihUoAK3Y d1hQ2XqpZSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg5gAKCRCPgPtYfRL+ Tm4uB/4rZI/lAiEuXDT7LfvXemVaA3M3+niMcTXjMkcyGQEX1ihFT+I4Q4ffrO+rGP/ob10jBUZ ZXzrNyyfoJXBMHCDKs5p2zpzDPqYh3N2/0R4c38EtEs2olSJLJ4hjBH73ZhIQ0KHzYOxl2lPtcH aA6lwXYHy87e3acCHGdkDrXD2iqPNIBcMWyMmeWn7ZntNnxxsishZb4Raenn63knuwpnwZxxYtX N+838V3v47+8ZEQHH0quOgD/l5vkYufDAckeeki15Jdhm1kaAgE5q37HtQEOrlaRY8avvEFSODE qowFlYVJo1AJ+ScANBSttk3L9gfou01all6UWmjWvcrDYId0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello Lee,

there were two conflicting patch series with a similar goal:

 - v4 of my series:
   https://lore.kernel.org/cover.1794347059.git.u.kleine-koenig@baylibre.com 

 - Pawel's "mfd: use designated initializers for acpi_device_id"
   https://lore.kernel.org/all/20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk/

Here comes the remainder of my series rebased to

	https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next

I double checked no new arrays popped up needing adaption. Otherwise the
things said about v4 stay valid:

 - The objective is adding an anonymous union to the various *_device_id
   structures, see
   https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
   for an example.

 - "mfd: bcm2835-pm: Drop unused header" got review feedback vor v2 by
   Stanimir Varbanov[1] asking to drop that patch as he intends to
   rework the driver in a conflicting way "soon". That didn't happen
   though since July, so I consider that request expired

 - I'm happy about every applied patch. There are a few files that are
   touched by more than one patch. If you apply the series partially and
   conflicts happen (due to changes in your tree in the mean time or due
   to skipped patches that you didn't like) just reverting to HEAD for
   conflict resolution for the conflicting files is safe.

 - The "Unify style of ... arrays" are only cosmetic. If you consider
   these mostly churn, just drop them.

Best regards
Uwe

[1] https://lore.kernel.org/b3d228fd-6138-4195-b63c-65b28691e18b@suse.de

Uwe Kleine-König (The Capable Hub) (17):
  mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used
    locally
  mfd: bcm2835-pm: Drop unused header
  mfd: kempld: Simplify device abstraction
  mfd: lp87565: Explicitly set driver data for the generic dt compatible
  mfd: mt6360: Drop irrelevant __maybe_unused
  mfd: rt4831: Drop irrelevant __maybe_unused
  mfd: Drop unused assignment of i2c_device_id driver data
  mfd: Drop unused assignment of platform_device_id driver data
  mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id
    array
  mfd: Use named initializers for arrays of i2c_device_id
  mfd: twl6030: Use named initializers for of_device_id
  mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
  mfd: Use named initializers for platform_device_id array
  mfd: Unify style of dmi_system_id arrays
  mfd: Unify style of i2c_device_id arrays
  mfd: Unify style of of_device_id arrays
  mfd: Unify style of pci_device_id arrays

 drivers/mfd/88pm800.c              |  4 +-
 drivers/mfd/88pm805.c              |  4 +-
 drivers/mfd/88pm860x-core.c        |  8 ++--
 drivers/mfd/aat2870-core.c         |  2 +-
 drivers/mfd/ab8500-core.c          |  8 ++--
 drivers/mfd/ab8500-sysctrl.c       |  4 +-
 drivers/mfd/ac100.c                |  2 +-
 drivers/mfd/act8945a.c             |  8 ++--
 drivers/mfd/adp5520.c              |  4 +-
 drivers/mfd/altera-a10sr.c         |  2 +-
 drivers/mfd/altera-sysmgr.c        |  2 +-
 drivers/mfd/arizona-i2c.c          | 14 +++----
 drivers/mfd/arizona-spi.c          |  2 +-
 drivers/mfd/as3711.c               |  8 ++--
 drivers/mfd/as3722.c               |  8 ++--
 drivers/mfd/atmel-hlcdc.c          |  2 +-
 drivers/mfd/atmel-smc.c            |  2 +-
 drivers/mfd/axp20x-i2c.c           | 24 +++++------
 drivers/mfd/axp20x-rsb.c           |  2 +-
 drivers/mfd/bcm2835-pm.c           | 15 +++++--
 drivers/mfd/bcm590xx.c             |  4 +-
 drivers/mfd/bd9571mwv.c            |  6 +--
 drivers/mfd/bq257xx.c              |  8 ++--
 drivers/mfd/cgbc-core.c            |  2 +-
 drivers/mfd/cros_ec_dev.c          |  2 +-
 drivers/mfd/cs40l50-i2c.c          |  6 +--
 drivers/mfd/cs40l50-spi.c          |  2 +-
 drivers/mfd/cs42l43-i2c.c          |  2 +-
 drivers/mfd/cs5535-mfd.c           |  2 +-
 drivers/mfd/da903x.c               |  6 +--
 drivers/mfd/da9052-i2c.c           | 12 +++---
 drivers/mfd/da9055-i2c.c           |  4 +-
 drivers/mfd/da9062-core.c          |  4 +-
 drivers/mfd/da9063-i2c.c           | 11 ++---
 drivers/mfd/da9150-core.c          |  4 +-
 drivers/mfd/db8500-prcmu.c         |  4 +-
 drivers/mfd/exynos-lpass.c         |  2 +-
 drivers/mfd/gateworks-gsc.c        |  2 +-
 drivers/mfd/hi6421-pmic-core.c     |  6 +--
 drivers/mfd/hi655x-pmic.c          |  4 +-
 drivers/mfd/intel-m10-bmc-pmci.c   |  2 +-
 drivers/mfd/intel_quark_i2c_gpio.c |  6 +--
 drivers/mfd/intel_soc_pmic_crc.c   |  2 +-
 drivers/mfd/ioc3.c                 |  4 +-
 drivers/mfd/janz-cmodio.c          | 14 +++----
 drivers/mfd/kempld-core.c          | 66 ++++++++----------------------
 drivers/mfd/khadas-mcu.c           |  2 +-
 drivers/mfd/lm3533-core.c          |  2 +-
 drivers/mfd/lochnagar-i2c.c        |  2 +-
 drivers/mfd/lp3943.c               |  4 +-
 drivers/mfd/lp873x.c               |  8 ++--
 drivers/mfd/lp87565.c              |  9 ++--
 drivers/mfd/lp8788.c               |  2 +-
 drivers/mfd/lpc_ich.c              |  2 +-
 drivers/mfd/macsmc.c               |  2 +-
 drivers/mfd/madera-core.c          |  2 +-
 drivers/mfd/madera-i2c.c           | 18 ++++----
 drivers/mfd/max14577.c             |  6 +--
 drivers/mfd/max7360.c              |  2 +-
 drivers/mfd/max77541.c             |  4 +-
 drivers/mfd/max77620.c             |  8 ++--
 drivers/mfd/max77686.c             |  2 +-
 drivers/mfd/max77693.c             |  4 +-
 drivers/mfd/max77714.c             |  2 +-
 drivers/mfd/max77759.c             |  4 +-
 drivers/mfd/max77843.c             |  8 ++--
 drivers/mfd/max8907.c              |  6 +--
 drivers/mfd/max8925-i2c.c          |  6 +--
 drivers/mfd/max8997.c              |  6 +--
 drivers/mfd/max8998.c              |  6 +--
 drivers/mfd/mc13xxx-spi.c          |  6 +--
 drivers/mfd/menelaus.c             |  2 +-
 drivers/mfd/menf21bmc.c            |  2 +-
 drivers/mfd/mp2629.c               |  2 +-
 drivers/mfd/mt6360-core.c          |  6 +--
 drivers/mfd/mt6370.c               |  2 +-
 drivers/mfd/mt6397-core.c          |  4 +-
 drivers/mfd/mxs-lradc.c            |  4 +-
 drivers/mfd/ntxec.c                |  4 +-
 drivers/mfd/omap-usb-host.c        |  4 +-
 drivers/mfd/palmas.c               |  8 ++--
 drivers/mfd/pf1550.c               |  2 +-
 drivers/mfd/qcom-pm8008.c          |  4 +-
 drivers/mfd/qcom-pm8xxx.c          |  6 +--
 drivers/mfd/rave-sp.c              |  4 +-
 drivers/mfd/rc5t583.c              |  4 +-
 drivers/mfd/rdc321x-southbridge.c  |  2 +-
 drivers/mfd/retu-mfd.c             |  4 +-
 drivers/mfd/rk8xx-i2c.c            |  2 +-
 drivers/mfd/rk8xx-spi.c            |  2 +-
 drivers/mfd/rohm-bd71828.c         |  4 +-
 drivers/mfd/rohm-bd9576.c          |  6 +--
 drivers/mfd/rsmu_i2c.c             | 18 ++++----
 drivers/mfd/rsmu_spi.c             |  2 +-
 drivers/mfd/rt4831.c               |  6 +--
 drivers/mfd/rt5033.c               |  4 +-
 drivers/mfd/rt5120.c               |  2 +-
 drivers/mfd/rz-mtu3.c              |  2 +-
 drivers/mfd/sec-acpm.c             |  6 +--
 drivers/mfd/sec-i2c.c              | 22 +++++-----
 drivers/mfd/si476x-i2c.c           |  8 ++--
 drivers/mfd/simple-mfd-i2c.c       |  2 +-
 drivers/mfd/sky81452.c             |  4 +-
 drivers/mfd/sm501.c                |  4 +-
 drivers/mfd/smpro-core.c           |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c      |  2 +-
 drivers/mfd/ssbi.c                 |  2 +-
 drivers/mfd/stm32-lptimer.c        |  4 +-
 drivers/mfd/stm32-timers.c         |  4 +-
 drivers/mfd/stmfx.c                |  4 +-
 drivers/mfd/stmpe-i2c.c            | 34 +++++++--------
 drivers/mfd/stmpe-spi.c            | 14 +++----
 drivers/mfd/stpmic1.c              |  4 +-
 drivers/mfd/stw481x.c              |  8 ++--
 drivers/mfd/sun6i-prcm.c           |  2 +-
 drivers/mfd/tc3589x.c              | 14 +++----
 drivers/mfd/ti-lmu.c               | 10 ++---
 drivers/mfd/timberdale.c           |  2 +-
 drivers/mfd/tps6105x.c             |  6 +--
 drivers/mfd/tps65010.c             | 10 ++---
 drivers/mfd/tps6507x.c             |  6 +--
 drivers/mfd/tps65086.c             |  4 +-
 drivers/mfd/tps65090.c             |  6 +--
 drivers/mfd/tps65217.c             |  6 +--
 drivers/mfd/tps65218.c             |  8 ++--
 drivers/mfd/tps65219.c             |  8 ++--
 drivers/mfd/tps6586x.c             |  6 +--
 drivers/mfd/tps65910.c             | 12 +++---
 drivers/mfd/tps65912-i2c.c         |  4 +-
 drivers/mfd/tps65912-spi.c         |  2 +-
 drivers/mfd/tps6594-i2c.c          | 12 +++---
 drivers/mfd/tps6594-spi.c          | 12 +++---
 drivers/mfd/tqmx86.c               |  2 +-
 drivers/mfd/twl-core.c             | 22 +++++-----
 drivers/mfd/twl4030-audio.c        |  4 +-
 drivers/mfd/twl4030-power.c        |  2 +-
 drivers/mfd/twl6030-irq.c          |  6 +--
 drivers/mfd/twl6040.c              |  4 +-
 drivers/mfd/vexpress-sysreg.c      |  4 +-
 drivers/mfd/vx855.c                |  2 +-
 drivers/mfd/wm831x-core.c          |  2 +-
 drivers/mfd/wm831x-i2c.c           | 14 +++----
 drivers/mfd/wm8350-i2c.c           |  6 +--
 drivers/mfd/wm8400-core.c          |  4 +-
 drivers/mfd/wm8994-core.c          |  8 ++--
 include/linux/mfd/bcm2835-pm.h     |  9 ----
 include/linux/mfd/kempld.h         | 12 ------
 147 files changed, 430 insertions(+), 472 deletions(-)


base-commit: 1cb7268b6638c411fc32f373e965eb8ba9e9b2b4
-- 
2.47.3

