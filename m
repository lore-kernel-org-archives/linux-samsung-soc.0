Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987819;
	b=yN04jV4Il8xnpns/xYf64azFPeZcIJsBlnm+hOr2Ztl7jvoYxZ+tl0dBbhiU+tSGgtDR
	 McUlNbvS5Uy8vIgEQ3iHCoU5oDq6BszxoWLIyThVLspMn5vxfgwExnwGpagltOHd2pPtv
	 XGkNcQ/d74XxwWU20OIrdGYY9AU/uJN7neBw7fadUx+quMTC4i6vvhxF1LyV+IrgXQPc0
	 PaKtFjPfE+wKlg21BWt4KEAEm0CWczRxYUNE3Qb+JsFjwvlWEma0ytvneFlF92hAA7x4X
	 npOv3bXbyY2zn1dNKy4IuWL0IFFkaoTFgJlVnwYlLkusSlWBKqjeLNe+QXSamNbOR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987819;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=rR6hxOb3bRxs4H5Z2aXCv4uwBxGbwBmHqkZH9LsDpsrTbNj5XQsBmHXNofRHz1Rib1S7
	 2407F/+BNOCf8/kMfZBGTS2yf9WU9cbwUbh/VLgjAKKLFfgyOICrS5oXBV6x/kIM+JeeO
	 JGvBM1B+pm5AeMMH790jF8vCFQVnbML7dUcRx+kWqtA3JAiaDgfMJgx5Kp9xbJENOM444
	 QH2xREDT8VxMUVRhn/uDjYzEk83k+7vIg8YpRF6UvVik+HP1/wBkruTFHHeBnmJDzO/Xx
	 tURM2fMGEpx6SzdELNCXhoxtpWcAX4FOZ5JnvkmeNxFLzWO50OaTnMT2bzDX8T9e1qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0C606A334;
	Wed, 18 Nov 2026 07:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF0C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72BE44E4160B;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2820E5FFAF;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C8D11BC076C;
	Wed, 18 Nov 2026 08:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794987811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=lvlw2APDkLOsWdPZXrcTGO0SBvJt5AeVKx0Z42miklOsc8vPctTcjUfLvtwVkHahSrHPLo
	CGkq45BFyuEH8fedQgM6HJ/XMbau2Rz9aKP/PJ7PtvuBj2hMJXvtJKDgvO7p6Q3pjLfN6i
	0Ut1+LTYYEyg77hZo16dxZxUGEgStz4MKBFw9hj/2Tiw4koxWXy5yQ8yIHNJQ0YwvKbt02
	l/18CHS5c8YF9Wb/y9UNTxVZrOZMCPnkOtQCGZPI3/uD2p7Qv4dv6TVs+LHq5iTBVHSMvU
	434h8Tsq1BRLh2Btis1Fush6eJ7xmbr9hxqVcPbs2tV0AeddsTbxh0K8Mz1lOg==
Date: Wed, 18 Nov 2026 08:42:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, Tan
 Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb
 James DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, Miodrag Dinic
 <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Qin Jian <qinjian@cqplus1.com>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
 <anirudha.sarangi@amd.com>, Tushar Nimkar <tushar.nimkar@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to
 guard_chained_irq()
Message-ID: <20261118084246.5b5bf203@bootlin.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Peng,

On Sat, 14 Nov 2026 23:06:15 +0800
Peng Fan <peng.fan@linux.dev> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

For the irq-lan966x-oic driver:

Reviewed-by: Herve Codina <herve.codina@bootlin.com> # irq-lan966x-oic.c

Best regards,
Hervé
