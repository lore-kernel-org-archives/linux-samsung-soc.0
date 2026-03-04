Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09093B3C00
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633755; cv=none; b=FNnPm+56RdY/0uNeXC2/TdHFobclVc/3HcvWBMnrZN1BEft8T9UMQsfUKyiyhoLPGofUMpxuzmXyinJtshXHarRhOLTS3ZcAyeqUbNAJWJoZv0UDlmPv9LWl0xllQNGIYrqUq8zmMnc9GKmC9rtldrhJDHdkjibBozv279awYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633755; c=relaxed/simple;
	bh=sOuf9crnr+mGWYcFQULXSYXyooM+1ooss5UP7AG6ldw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEH8exQl4wQG38FJmBMK58F3Wl+TWYlGpsl17zh1ePLh7l6ooWp4Oqlp7qlav6dAherMUeZrglIHQuIoISCBay8FoPXEW/15i+fIYqr2xX0moutF64937bJSH4vv3Qr2jEpsd58cIb02YVXVA3ZRGsod//v/wLf4CDgv51ws54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3y14wte; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3y14wte"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3059785a91.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633753; x=1773238553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=c3y14wte/Zrj6mW13RYCEN5ZLsiOk35SndeJGwzS/iETGEL9b4YzFr8tpseLouILrk
         cph+xtKU1zlOPnwfL7R41HWQcazqujvlDCrXV8WWsHFtyncdl7fCtbR77F4mrU/qCA6v
         CJ/m5h8CAbW8MEy4XnxPHpo7JQHlxUHHMA6Pzs22KHJBvMPXM2ikoaDXTb+WCeQdK541
         iKTax6Y1zvUBBRrCY6PlIL9SD3u7yEMBqJUWtJewxLyT6Ttus6jPL8Vw8JqHMSI5OHvG
         dcX/h1BEL4MphJSqwY5LCyeqGOoRCpaN3boag3sculxRkSQ4xhiJYSaS+7TRrMYYHEd5
         qn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633753; x=1773238553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=chPOrrwRCekqEGm0uLPBrzLeYE2JT6+yPPcSVaWk3k67q3xdMXHfgqmbpS7v8iBr8w
         tZMuMzL3l9jcyJyGVPfc3WXRED6Rw8H6XeJie/7onjx6s3mAQe6ELvcr2oB48TrIiGF8
         aUjbl2Ci11ly+4gWQEBsHJhRRQ0eLeScV96DUBrAs4o+JATGtEenkMPR38nI8PkpdSDH
         JmXSzPu4aUZPPe1UhIeq9F41aKPbgmxPbwT9j7mMLUucykC3e2CKEW2yZfUwb2CLForQ
         U58xkF01N34QZGPL1+j47cmE5KZ0ah/9hWvGcKEcuKtHlOsfn+usbnV4H5LUVyG6eVU4
         bZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtK8x+ctDcMuf4PI4XrkGxwU1gqWakATNcrFiz8LB808FreKMwyMTVGv7nLovF8oWMVHY7SrR3SqeI8eJJuIbWAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQLdTyshLkvnTqNYGlLM1sBTgsp03evxQ2wZY2qraJP1JNHMo
	IWC5thdCrdBLPm5OjZbUmSCKvA2NHMcS0LW2VBhG+6IQh1Wr1Vah3cKt
X-Gm-Gg: ATEYQzxEUC8R5bJo7SAQdarDyLGlNDDN1XNvnBOX0dv2yQ189jUf/VVf7+37i34nuIr
	OovFqCIBF/kfCi7oJ+HyB07s24Id2sG5z37c5pCPk14fufMd2+m9h2MSY4a9+jHCqZooo4ZCjs0
	hX84tCTmhdpaPtes+GgOHblMldX/MetZpKQE4wCq8O6p27BpDnZS2CboR5aSJw+9ULP4KCQBuz6
	OuXjrNBv1ISCAGMtgECF+sixRuXnf3y+sGpUXOjh0AT+wOWX8IgdFxw7zqvDIl/LcfABRS1geXr
	4FQ4QGbjLzyZLsvYXzANNCVAGZSHhMWhRH/h82yrY+2ytrV12l4k4KW/+JrkMU/o5fh0dwFVWA9
	jMT1cNq02mWT1fJrCZo70qwg1FrOhBGfm6UeYcs/qqZ+szkGDuYRpSKWsiRKFnpU4Mi5zyVFVbX
	i550rjZ/sqSOtA7Xawhxow
X-Received: by 2002:a17:90b:3506:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-359a6a66b87mr2001714a91.24.1772633753114;
        Wed, 04 Mar 2026 06:15:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:52 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 15/18] PCI: sophgo: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:58 +0530
Message-ID: <20260304140329.7089-16-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..0393f4b613de 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -269,6 +269,7 @@ static struct platform_driver sophgo_pcie_driver = {
 		.name = "sophgo-pcie",
 		.of_match_table = sophgo_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sophgo_pcie_probe,
 };
-- 
2.50.1

