Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361B3B582F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633320; cv=none; b=DHyEOUxnfA2qqiQAfIAUGjZuCjFPy9QBEX/y6XEDXp0opc9ILtjGOTUir0HQOCfn70T0aPl1LyOZPQLGJ5ymBVbfozOO3g0LQaUBQvVWiuyTZIViTWL1puLvBwrZoVwY2R6uP+PiXQVitA9Lrw7tz+eerBxeN8Gda3EFbcLKz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633320; c=relaxed/simple;
	bh=mXK/wuVbL2lWEcp+yVdrQP9dP9C5hBIvBbQ4WfvEi58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pp6CEvYT6b3mJ7Rc1PMeThJCARQNSMzW1nXbRmk1kLJZj7CSSsaq9ZSNv1hXE/W1nHahtt7tsSH/aihA1XvvB1Ex2riOgm/jyyqeXa2hAPJf3FFadZcUpVDwitBU6V2txM9QazEQXzZkZAm/sD/t9Fpt37BIwo6PdCrmaW/jlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/kcf9Qr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/kcf9Qr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7059b9df33so2587267a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633317; x=1773238117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=h/kcf9Qr0kA/T+StyAePzfdudHDzBmt6t0hxJH0NBCD9THmzxdFfGDcsAsj9dMKU1n
         k5XEg0u88YpCos34oPQiZtfsElI082N1pcEimIng5NupHHSRX9a86Tx/h7Vozghpb1V7
         yHNz/VGovUux8DVY2b4L9sSN/w60MYRCwM5PpOZFEcQLzfgRI4aS4CLidlldE4rZdmEW
         2keAzvbzwONbPi0m2b2D09tC2v8NjdprQQFn+Ue/evS/CUsKNQIWjyVrkotWhsMfzSoL
         MJbnkFuHgoI8b7zUMdWdO+xo4qBcJLPc8ZHOMQpEX8SoHzFaID8Z5TllIcH/I3NQFLnc
         WPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633317; x=1773238117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=JrpkaERKkbhz8JFOCUVYwiES4Njb9FTxgNWEmDqzdUwbymahiYQHsDcPLoCSOLSt8I
         GoEar8khs7iTScrX0Tg2/b/B669D/E3wbqeJGqWngs9DQlNH/mk6ByTpM8+HTwYPRPEd
         7ztHA5aWXoA5VLySIOXW+4CDrQ605HFfeNBv//NghRtAt3UTX0iABu+Smp1msUDNW9YZ
         o172z3sqxnPVlgXQAl2atPDiq3xGTIGSt6p4z6G6chBDb1Cw/Z8X+uELrB1ycyHJDOd9
         Bx0TyieqxvZaux0N5m6tqEYnyx2zKabkQ2SBHU28XmyyaZcf6Jle6me40jfjW59UKx2W
         iZPg==
X-Forwarded-Encrypted: i=1; AJvYcCU2d9QbVqHDBvrPxINH8rpZZD87bocfVLqvgnKF2DhSOExhLLjybqsiipSthZxv0yWlbBsYCzX34YrrNIoneP0nSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTgCak2EJIEk9/hjhFnCNHSDCJp4aisK2dpSQKmO4sGNmj++O
	gvyx1GL8YDINsdFkVh7we4cdMLAvgZh/9HoFs/GXRAEohMvwyIW18WKj
X-Gm-Gg: ATEYQzz+5xsMP5hEmC3OYW7Gubz1JOxBIZOIWamRHj55iAtElFuQwjsMQ5IoasTHe1n
	0ZM4PkTXkCNaiRSNlZmvUewP+9vlNqPs8ZEnZcfAk2tmigweSbZvK1FoJn0ye4+7d9urbfR7VmP
	Rcnfh2XPzc+0TpuGtvKYHNWVJSLKYqNF3wWVH0IZP/pCL7GmdVyOXgY/i+iH2+UW10Dbxr+Crk5
	2j/6sF5CQm01RR4e5/qPaYj37crIrjtdQqeOT29uFH+wnRUgNRBibuhUjeYhCjZ1GrkRrQOY1Os
	/UT1CrS4kd1TR8/vqdfmykRNi/9zTbiZoTjTISwoG2wn4I+L+G8rXGxa+zQmbD6JIsNIfc9ZG9E
	/WJlb2PccVTdhaa58RZiMQNPEHrIMkzMzGt79YevdauNo/ZrbFePS5DzLXyEqlRoLzX4s47u1Ci
	pEvFGPb41EJwe2ndmHgr+u
X-Received: by 2002:a17:90b:2d8f:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-359a6d8521amr1962255a91.9.1772633317107;
        Wed, 04 Mar 2026 06:08:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:08:35 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [RFC v1 06/18] PCI: dra7xx: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:49 +0530
Message-ID: <20260304140329.7089-7-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..be470d54b2ee 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -951,6 +951,7 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.of_match_table = of_dra7xx_pcie_match,
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.shutdown = dra7xx_pcie_shutdown,
 };
-- 
2.50.1

