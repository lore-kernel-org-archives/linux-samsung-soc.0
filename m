Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C13B3BE1
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633708; cv=none; b=s3TDyz36KFMBMzrUu4CmJDjZBq2q2LfLubc1KLs2GxHag4ApCCJoWZI+Q3yX/we8u0grW9Kqd6n4Uqkzxo8w30dlbXsLq9y5RBUPmuGnfwAtBYTT7rtdYUmxkcPQ4YBQSYo1SkZxbKM+L+M1nqI7YNkNKsC9eRVQ/TsGsRPdNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633708; c=relaxed/simple;
	bh=HOw1M4d6fLEqGRM9wuHly7wJbsT2rgQ5OGXMw/g0QY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSEmYufjZ5PEIyFDO+vDeedDlOYXtMnxy9C5IKTwF9uiAe4CDFbM4gHSOROvbZXM8U7IOm3Yni29k8T+Yls7ipFbprlr0k2aM/djIDkK5qof9kvkt3lVytk1Xt5/p6dxpDDj7C5me7Ii9qt97eh/0J4b8UBjm8XMyRYpOxvMgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9OPrAyO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9OPrAyO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3591cc98871so3035057a91.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633705; x=1773238505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=H9OPrAyOwo5RY1sZL+TlLHmCrPWRPUMFsaL5AU9D2kc8sj4Im3uSWUU0FRkYJMLuTk
         UtZZPSaHciuS2gJsK7bJqoqcbmSRS6TcnzGpF5bf+LMWrl+Vx4tnI8PnS3rDjHk2g4ng
         Cggmn5+9x/0DOwfeC6ZQr7Y7qrdM6qBjey33CJXauH1NxNZR9Cx+sH78tj1FAAwystVL
         r3jCkTfggQBWIXLv2hubCcqKjCjTthcEHR7lum447nyHGYjAp0g0zBVc/a9NW+KfQu2M
         v+lAp7x4kOVTA0Jso3y1HxcnHBPVayu4bFzdKHAKpF1iBw/LQwWj9khIkZSL1vPTLpyX
         1bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633705; x=1773238505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=AlbMgkgSwyrOmLAtfy8WxfwH9y3jwZ7Zz8FDAyALLVi/ZoMDlA6p6dI92ahXlvR2tz
         D9Hb/BBKG980IOfLnQZ5McEnqoyFjJPQXd1SFZpQpBlZdffNRH1HtrFoipD4jakkBmEx
         Hc653Ic26nr9myQCP5Ph5a6ShEMW/dlVcFclO0z2ueAKUGIFyWDi1lTQXAdDgnnv3uq5
         uA4m6z+MGYEI4zGLy0mPkXUTsLuY8s/WgYo01NEj3kiofojDx+dNB2d9z7cygi4QD/n5
         1QrE7jauDug8Wn1S/bCHrRbxtyAm7NExcJrio23M+qlHMFxuo8ukaj9I/e0WWa0UqRsA
         6JTg==
X-Forwarded-Encrypted: i=1; AJvYcCUtspq7ebS/31sEtFGIv9uF783+LlnpO526Od4GDnyVPrNqluMf45e3foPqi7wkuOeHUg3rMo4TD87gcy7q8px6eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUO4t9m1r4U2aekzaj3hyUTbhAq6483ckzRKuX95GNPvoSU6IP
	MTf9wnMiS3pNrrsqIU2Nx4ArVw6xdYBz9zsfJICZskfI+NTYCsHYbyKB
X-Gm-Gg: ATEYQzw5gAcvlNtLgHOKrK4S/VGqwKbRFnW8l0XyduGpen7QbeHRkKcrkKck/NYuVPA
	LGiU3k/cXzoOPGUD8tQQZZ6m2HUquLvUB/ikpXA5bL8w/VHUvROGSx8oy5ajIu3w9PcKRf2/V4R
	sHxB2yonDsjyMQMpaVpQhUv+61nGlQbLWKztaDHOk2v6aDHE//6fH+YfG9F1b/uYsJHNVJImxRp
	0SeukU1ngnHpUbOmq1ZMJrCv3Q5cvZ9UksEGt2Of3KMDA8XRRpVIEJj9c0vYXj/FKS67PIgZK9I
	Yzy0PQrysrahJChe5ltbUddM0zO1Rf2dXgZnPjZuXaitxHa3cy343xXmDexm4ze+W5SBZLRV8bE
	QY/t7OKUMax0cEbAiQKj0p8tpUNVMAPgw71/PO5MUn7YUA9jGgk59zfjVg5o8ZKwkWpykY/fPbm
	H0fRvIIJ56vq9h8Z20h1bc
X-Received: by 2002:a17:90b:164d:b0:359:964f:491b with SMTP id 98e67ed59e1d1-359a69c8cb6mr1870621a91.9.1772633704630;
        Wed, 04 Mar 2026 06:15:04 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:03 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 14/18] PCI: meson: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:57 +0530
Message-ID: <20260304140329.7089-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..280146f7b783 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -467,6 +467,7 @@ static struct platform_driver meson_pcie_driver = {
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1

