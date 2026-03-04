Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AD3B5842
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633417; cv=none; b=I1mh0xyoXK7ihj8L9aMBXg6teOdHGGepqf3sJYDdPMJ0ePzyiexSMxoqvHLE7isc38SLnDDbMcilm2kSp/FwU9zmcpbg7qclesx0QIbzQN/HDO8iJGvjfX3+OwvvIisaR5zRW/3xW0lyJ4yh5IaOrhYKYPnnwBTEi/TWRroBRXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633417; c=relaxed/simple;
	bh=hZV/UApDi6vbj4CutuxmAun4DaiwUR/7OjFMcmuWnvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=equ2SEYbKaSplLFTBr8UiNmfpUCKCEikZVk1Mv/bSgQXpy7NMODjo6Ry+XDwPdUeFhob8qk0g29RfNrypKYwKOZMrjl/T5XFBcr6xB6UE4JXqaq+XZmSc3Bkigjeog1tFzz07Z9T70ahZE+FpN0bKD1ERKhv03ynY1ZBdL9YCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh/35wAk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh/35wAk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so2391514a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633415; x=1773238215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=nh/35wAkw4B12/EAIZRhD+Ox7tA0oYng5qi5Zu7Hj3rx5v/RER/fVzxPq16C0wr6ge
         vVNBODkVanbDtPCboMq/sg0QbnsabKhOxOVT2LPdNHgzV9WHRrnfKm+zMewCyrFLhCdx
         AnpA3XjAh6gFdLB3VNr0T8ob9tJ6a7DnZ0B1qHHuDhaynSm1bX2Na5huln4+Bf1TwiGs
         sbSto5zZyaRwdjoDPjx7nX3a0/lnsAdKYcVHFFWElogy4DuvuTFPwtBP1RQBqp7K00ya
         +VeavyBOfeCssjF3xx6C1tW8Yz68chluh2yL3jmhLRZVluN/mldJ+gXcYNx4SzMckm41
         do9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633415; x=1773238215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=ilHeIbd61w2fZL/3Uw+5X4m3oQXH6R0/7FFRuSqZO69zovSu9pEcEg8sEhpPeRXVJ0
         C3LRA1hwQ9mQI4PhW9WbsTmqcGQgte9PLq16hRqfTuIy03ypilYJrsOnNSKZ7F6sBNig
         J+EUMZtKyXyDH2tScDU9ooLWlQPLvZUYW4ueUQmi1/t0F/Jy0GxfHGFmX7VM5kt+/pg3
         B1GrhvixyU66BdFsPhfI7SbU+807FUgwqxMqSIR2rpha3ktlo9NIMGiJ2QxOnEWO1UAp
         RUL4Lp1x3CD5ccHZLbxeuyuvc17J0UEuZjc32gB/V9GXHtz0QJAjgqGuvHKtD8/PoPLN
         H3fg==
X-Forwarded-Encrypted: i=1; AJvYcCVHVXKGdVPeWvO14qiy4znI7b3tR7mcchfsdOelQnXp8YTrhCuIMBL1+wpvgZJQLIkNhKiMjH6gQXpj9iPOcndwNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymskySLHWkR+Qcp/Vqb6NJS4/qntVPDIO4QEw+kmrOnwDn/S5p
	gFy3lK8YuFvEo/Upm22X4E3aSiv0BIsE8edSncDa4wrr2eclSe4mtRCQ
X-Gm-Gg: ATEYQzzYMKkxcRhpr6NKVmkcBuHDXjUuQz7qvvVO7aji0nvBA6QzzRLgyOtpVGwx20j
	P+OM9dDuIA/jbb260qr/5FV8XsFYX+k4V3DeUkVq7JkQjMKoWxPU6wCtSm4pDpta4kZeD45x0Lp
	C3GeKCjBsqrbV39/bqBFJxMoirt2FtvOxTixiZrH3QkFljzJZmUkARA0mrSnKMlpBpYTT7Njprs
	62QqkAZjeA9mCzYCMNlzNKIkRQE35XOyTUGxHyqCOROi8PRophOTzLCS5hN3AAZxfszeyPKWAZ2
	QoFo5nYaCuQTnku6GDukD39wemVtlhugffjG2gHE2f7z1s9E3Cu+8f/A1+y1gOvjUxqen9ZPVch
	oJzMywAyrIZPPAHM0s0D97KqnoPlfGs3+OIfN9+S7mH/r889QUawOXLadG/moa+8QNgGYPWlVR/
	oPEIckKPLgKWLUwI2DRD4M
X-Received: by 2002:a17:90b:2e8c:b0:359:8c89:96e5 with SMTP id 98e67ed59e1d1-359a69caab4mr1729374a91.12.1772633414915;
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
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
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 08/18] PCI: fu740: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:51 +0530
Message-ID: <20260304140329.7089-9-linux.amoon@gmail.com>
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

Fix the identation of the callback functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..aa6a15baf3fd 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -346,9 +346,10 @@ static const struct of_device_id fu740_pcie_of_match[] = {
 
 static struct platform_driver fu740_pcie_driver = {
 	.driver = {
-		   .name = "fu740-pcie",
-		   .of_match_table = fu740_pcie_of_match,
-		   .suppress_bind_attrs = true,
+		.name = "fu740-pcie",
+		.of_match_table = fu740_pcie_of_match,
+		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = fu740_pcie_probe,
 	.shutdown = fu740_pcie_shutdown,
-- 
2.50.1

