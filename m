Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC13A872B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633270; cv=none; b=RpbPhIzgqBMbdF2ofLk6kjti8/xGDUfs3zJ1WNDiRIA8CiMgaYD4uW7hw4AU5XaGXLfSGIaN+dHdsot0Fv7+Ap81SheNN8kErRRR7V4/4ruaxi0bpG1f0brnqUmxwi8QvRmfA2tKS2AUQMMrJroRwHD0cjWf2F3WupPRs+recMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633270; c=relaxed/simple;
	bh=HhGm9Ohbx6JvMZfjKoxj9JVYSgMdWeij6sbTSI4muf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bl+tf8qKUMIPXKMI7CGN6n8Zyn/kOGBzPUai9WIa0NkYdIL9UoTiN905mALMGj3FYUKVrZiKbDXKEcHEVBvi3rACkAGNfY7uT6D4UW2eav1MSdB+5rN4BhI5jwLlRxEasvpJi+XBbyeb0uAYaiSQhOAVVQYquo1ahfpaKxbEneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3dfq/BK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3dfq/BK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35982fd8910so1699543a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633268; x=1773238068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=L3dfq/BKd2UHFBSK49/tWZVNayTscVsi4K7dS22j53FBnyMedu1YoWrbLDXhSnTKbO
         OPOginDL78Ww60xffXl5Y5QCEUuIvouj4oEqZ+qNbFxfhvuHvakoQXg6JpKpJRePhTT1
         K4HA8a+Wv7z1c3R8NAdAmJnYwJZNy/vnjtu1r6CIip5TLxXJkuObfA9IRm8APyxynsvY
         t+MAQuOoUycygQcAoLKh+grQzul81PKIj8P8EpK8TK1vKPPLMDQFd/cMI6PneP0HNbJP
         ddRCvAGYzILWjWMXmAAbisLIlhDjQHZpB2Wfoq5u4ZLP0imfVPG+PBRXWJQBChkPMv/N
         dreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633268; x=1773238068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=LcerIUm4OsUPlPrYsfNfZFmv6Ddc3n4p4e9QkN5xFruLJa2ObI5QTzxm9dlqibyaFN
         xSAvMY/YdKzKx4PfGgTpRJgjiMFIkpCDKh39jecg0di5AwbLAVdeRVqUhTXHjf0qnpKk
         dzz6QuXbyPGwpM4Qfy/Tv4qNlPShReyRXWbEMhdZfNBLEDFL7gSb6Oj2Xbq2T2E1Z9bH
         P+EA3EknNySp+PJBO35ctyND5YhpGNFo81n58bU7T2rRDussaJY64T1tFQYTBQWQQBRu
         fUk/xLqUHGajcezqv0p0lE/YH8419CK9vXcikO1GMlnx7FhMtnm74XmWyHBvL9K93yLD
         TssQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEO5tW+KTd4diJ7wPAfM1UtGiLWa6j7X2CAUa/Ci+ly1e7N3zhkDHPYUhmMFezo9oStvpkVDp1VmBp46s1XV5dbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCB7nzwJA6RC2giHTY6Q0x50VJcw8mrGpajMf9CUiFFS5Oseg+
	O59/DKtwqYajyGg93Os80v4jlbRWPWv9N5ykXSHalOoARrvBTPS9+OoQ
X-Gm-Gg: ATEYQzzSbMmBs5sgQsckiX8IoDgMf6ROiZjk0gpLWcqcxTK2ZkNChctxXGcP7fZj2mq
	GqNPMNi5+Otd+0Q6Nj9lM/6dbTxWAHtqQdNrMS/fCuDV48OcLZq1YAOjTwUugvn3+9pQXRGyUYv
	PZTCQvzkqkZ1GTGUhhE853/aWd18TOTQeNxWmgLD2MKB+QsOYMuD+DUuTlmEbIDJAdb3vv91jkg
	bKpvo5XMRWprP2rIwoYFZFO6tgoWt31Wv2u92aT06TihsWGnP9pPV8LZPMIUpGJkln86m4jZbTG
	JsMLbYzFZuHkiph5Hc3ok1CT/b975wwM4fvtGi6Y1jKOlx4BFZ9CO6BxU14rTnSIV3B3I1+bRAu
	Ez2cnOdytmLAyoXCVphI+X4VMsQEWh3AKpecNnhBug6nj7OablJFFRtU3onDEqKmtBQV37pqseW
	U08UoItJJ/9ADrOhmfwBX2
X-Received: by 2002:a17:90b:3f83:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359a6a4a2fbmr1903833a91.21.1772633267856;
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 05/18] PCI: bt1: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:48 +0530
Message-ID: <20260304140329.7089-6-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-bt1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
index 1340edc18d12..ef6a3c7fa279 100644
--- a/drivers/pci/controller/dwc/pcie-bt1.c
+++ b/drivers/pci/controller/dwc/pcie-bt1.c
@@ -636,6 +636,7 @@ static struct platform_driver bt1_pcie_driver = {
 	.driver = {
 		.name	= "bt1-pcie",
 		.of_match_table = bt1_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(bt1_pcie_driver);
-- 
2.50.1

