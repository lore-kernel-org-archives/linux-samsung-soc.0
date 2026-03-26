Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4230377EB8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515508; cv=none; b=ahOaZipn4IH4VrFyQ5fAhU/Lu9MsTqhbfW+wIgmV35/czfMFTiqdoerUGQeaj5hK/39nIoBfUZZ0ff8zdcr036X8tRdAesZQrUK0zpBCy+QAlCQTQCWgOWtZ3kR7tVGZt8rjANfIFWX28vC7D7VOlwMG7reeSZw1rt7rA/Ot8ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515508; c=relaxed/simple;
	bh=QSCkfnKsrDZTYKx1YNAx8qrghSr/qzKl+1Bjc1+JQgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KO46+3zoN2tSWxrTG/fUj2+uGt9mQEhXf1InvVADevVNn4Be9aco+Kf0m3SLCUH01OfyARF64Ij91bJ5I8tR3fTLW9+9IO33tP3xXhQGQKXxyanxASySQoXwOyCxrbIYf6rbSDF2/ktxovq/EoBgFcflF+vKBgzJi/14acS/7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsVtwG5T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsVtwG5T"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso220875f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515505; x=1775120305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=LsVtwG5T1mNeGhp663UJYgFUSweYfBrKfqxDtL6ojK8cb+buumXB8by9pLMtpxhpcx
         6f6DecKQmrEEp8n20G4a5RFoPPML2sQ1BlZlBMBY2BZmpNnSpMvmqGklMGodwh39X5HA
         6sXQohbBPB/5tGZQx1TUBx9frAtJEHcttsrkI7xW7zDhMIuBvG5/HpAQm8iY1hxU0rtT
         DiJt2R31sCkzS1yvrFx2KtIjeg1wu6Fhlx4cqPlS5z5KNW3zUTYYpGtKuyW4LHBn3eNU
         KPYw/KElsOAk3ZUtiUo+J+lghJd2TmGuL9CVJTrvlXWEC9zp9wfVTU8e16NUq+ANvAvG
         j2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515505; x=1775120305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=ceAX+9Lcv47yUborVJS+Z75mR3QXd8EbB1+JRUccSd1Fy8Xz5JzHK6NZoTx79Fms7A
         VFrvpk8BALXK+Eci2pxYZfnBWapBxgfLwkGaDJp7XTzeA35XcYUPovhY33iLajWPRf3e
         ZKMiiqASOtpmvR5XomUJ/Dr5dL3jsPMhB96Km+T5pLlWRMOxw9DXrHT7he0/6DD7R7my
         q1GUoY6RSwyeMeyGBRjnF98ngl9jAeUr2U1jGQoRIP32CDOv3ulvkY/8qeTfOAoYI8co
         vbhVFmmYIXbPCaIMQwSzmVwNE8UcIQDFEI+qTHby8zQUDvG1Jf74xLbuOV4azi3ZTCQt
         1w5g==
X-Forwarded-Encrypted: i=1; AJvYcCWXAEU3x4768w2nQKc66gPcSS47qsP1zYJSyoCJQXcQemcg/3X8vK0NUZLWHpWtcfWD3cr+9qx2ArNPoWV61HB16Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxQDmBZ55RDEBEmPujjFUKG0TLb4S4OylNrYUcbhGYUOQ/6jm
	nXCGyw24YKm3MU9CWJNNST+ncPc1HFLMYsnSB27dcHdftDGzDgbcuR4ihuWKMMelPyY=
X-Gm-Gg: ATEYQzwvYhS/6aZ+uju9UhNA1bi9fydEQmRWfIUY6uWNvXd2tbmEw3HJnBRUtlQanNH
	PPgM7i5bckp4bkvpZ32lczE2NAAKzzvpcKuZridoNpFZLXDpVnHVJ18dKfghGUAAOn8dR+WtrMW
	8391cfXFbJbWsuk4VcupAQoBwJtUz9BReV+4h+LRqY6XlsRuS7mXZKG3EmY+aiOS/W/S2Df23qn
	S4OQ+pVD6Sc3FkgZTS7eBhaoeBXr4G96E4RPIcm5+U0VcXOihdy6INKzerulu5dWakVZ3gUk5jL
	jPhn2GEmJmsgg/KShmkY0kxr1mvyZgzI6rgDjOOAxxB0r8Hs6ukh8p+Gt0WWYTz6lvaVpt5tUk+
	qJyHdzprEmAccrIQP9umzgO/adZICBCeRTC3/lBpb3g8QxjTyWNymQIcwF6TS1TXNmVItR3sRW3
	PILxz7tyKG0Zz7DR2zaHuG9xscK3PFTFPhqeJvW6wDaWZB
X-Received: by 2002:a05:6000:2885:b0:43b:4881:cee with SMTP id ffacd0b85a97d-43b8899d440mr10250351f8f.1.1774515504858;
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5849382f8f.36.2026.03.26.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177451550396.95191.10019790997295547194.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 09:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/amlogic/c/ff6c02a40dc8706c0b13b3b12cfe228c38bb7857

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

