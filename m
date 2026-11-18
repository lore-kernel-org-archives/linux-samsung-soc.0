Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001885;
	b=NfZqP/No1ASh4oESpwcpn6ygi+4zQblFt4lbCSgJc2IbR28H1y+uOOePXI4Wqf5deHec
	 JStcukmk1kFll99CglMbGux+Q5G5CmG1gJKbdbsSVPUuuAx6SZd4GXGfN4Y9QKFl9yRQY
	 Olz9v044p+3SXZfOuzi539H8M7dExIMRBXF7eCT0mfKQYNsFjHviGTCJW4d3DEEPatDnT
	 f1NJ8yYAHqiL0Sgg2cpTJAWg5X4tpJt4V7zubsXPXw3AqXfqFOczuc/BcJJwlaGC1i+Y7
	 Vx4pPFgN9Ami5HK235sTNGfTIoUBU06tySUskHeUlAwtkQebI9oMaGxu0Oagx8mXxWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
	b=3e9hjXHea5it/G+bBQ06ZXhKUF8AD/tqrHKKrtNALRe3bkQjj2FAqFdhql7AFDF2sjDV
	 17o7wVlkrNipHlPChFikwyV7XQo7KbYc9AafG/vhbZkUwcnARWSXTCq7oF02Pb+3tj0lW
	 qDxI2xO/eqE/j3akEDCbA6j6xkAB3Ht4lVr4ZQqcavfk+SF6OyAty7n1yLzJHqrSgWxp6
	 J3YYse1OcnOhOxDhFjNJwNDaQbgSTDGrW20QSpw7QryDvnBn5LiO0BggdM7fLkUNNSxxy
	 CnTChfw5gjMDRItkgD00bQMeybiJv/JvbuQ45s4NIhH8lvUKqDTA6Qp8Ljdq49gEUFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C060A260F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55C060A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso597363a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001884; x=1795606684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=v+7og4LCpbgt8zqV0qGj5L5k9LpgFcD0H0EJlsFDgNHGtKS0F9k3naOHe+9i/2bWeK
         fPnCiGrJ1oREJ2+h9P6ZKwmoSXSZwgkiENGzo78/EZxbAgOUuY7qaBdPUhqxxdZAdfMn
         PINW7m5SL8HOai4MWvu+6qrQ3a3gdYcAWvU+dqtYCKFjQTTY/LjyJEp9BT2ogV+kY6jV
         wQwSCQwUH1MCU09yI/qoVnTqk+MsQEBxxK++4yao1W4KqJSdklyQ1POSzEjEu3h4QkPN
         R0NvlLmgEt57FkDf2isa3IkqaEuFkxQCgoorgkuw6Irqm5R4d5NvSZmko/MjOATcgF/l
         X1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001884; x=1795606684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=bEqYHItXMDTHhWOOTSoSjiCvHVS6MpsAThSVy4NEHDXkmxWFP23+tWCyyE6srUEfdb
         BTb65gleeko67DVA5pMtzzj7IV8IpT/xbryfp2UX+ICJ+CN1KBsh+h+LMQri1TNc3Nwt
         x7UOTf82GpcARTONno00vwexcHy4Glw5a/EBM8XR6nDAEMcn/B/ET3gnmVbf7mOrDUxX
         pMJfSDnvZIKpD1tgWOjrcFfaE2oJk9RAFsvf2SbkG8s/6An0Z3M05Agj6vv66lSe5f5a
         HeUQFgONESYogzUfJ9MCasxBFdU73Mr2qKTo+3FJ2++hedcfDXGdCW4DUxyXMflwk2MN
         ydkQ==
X-Forwarded-Encrypted: i=1; AL+hErFeVTtWQJ+u47cw3X6aWnw2Ea+9xX6i15ARqFL9zZsjRDG/jSPj8B+wNx5ROYKke9LVAEGS9Tkhw9mM/Ec5lgJRQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z91lm6hAmoqc1So1a7Lm+tiDyDH9EeXpsZLrDgPhU21bhg7zdJF
	CDFCog7ER52wPj0xKsZRx+bNfB+yhy7Rs9Q2g08SxEPhDYigegF7d3HD
X-Gm-Gg: AZFdTZcPrFfMf001e7zT4QKlnIswtjAogLP9Meu9eonFgaT4sYpnjHFnZgZJv5Medcu
	+KS9+p/kD9PL/eoEf67bYMRvG1JYwB0jjctXeD6BIEuqaUAf/ULi0cih8s5HQTl+Lr6Zy6bxxmT
	rtAnfB5kf88ZQ0jDgSsofoBKGvxKNF2RV/xgtnzE/qlLfCxtYkAuLnL5PtLgfDHsiNBcaKtTxSo
	krAkX9gn+eNRmnhTPSIPKo0Emt/9o2QlRTrjGL6NjxWCcmOlygx+3EneJ2vPXz+ABrwry/o4n6P
	Jk4fyajXvMMtdQVeh+z9d4ZcLK319ncJQBw8kWGwlvYilMW+VvICxecP9pz7/KKqabyOSUDxh6C
	/lNSWF2BJEEhEaegaimUrOJfpS4C3UszjRke53AXRCmIHWUsGuyMxjMynPyPcAGMiwgPRATFnIp
	NWAnUAgBmveoMDX8VAI9u8z+pU2F54UPatGDy6pLu/WHs6VzU4QKSqBO1+mYVCQI0EnV15KYYo3
	afnx8SbisMbO6sBEk6Kc8PmzrrRDoD0W7YN27w+A10O+rQqHZEUyfB/x/p+5GGOtaBdkFCK2Zec
	y24kLbElLBRB1+WIAOj671088PJHvIpuEQJH+Cbgnpwiq28Dr7N/6cxirzFJsNiZE2PvupgTj1O
	ve3oOivwnklI=
X-Received: by 2002:a17:90b:5407:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b3d074d841mr2303560a91.15.1795001884103;
        Wed, 18 Nov 2026 03:38:04 -0800 (PST)
Received: from 1.tailnet.ftu ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8950084a91.4.2026.11.18.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:38:03 -0800 (PST)
From: =?UTF-8?q?Tr=E1=BA=A7n=20Trung=20Nh=C3=A2n?= <nhan.094.vn@gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
Date: Wed, 18 Nov 2026 18:37:19 +0700
Message-ID: <20261118113756.304373-1-nhan.094.vn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com> <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
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

Hi Peter,

On Wed, 18 Nov 2026 at 10:51, Peter Griffin <peter.griffin@linaro.org> wrote:
> Does the Samsung bootloader not pass a correctly populated memory node
> for the device? Or is this required because UniLoader doesn't pass
> along the memory node it received from the previous stage bootloader?

From what I can check here, it's a bit of both. S-Boot doesn't build
the memory node itself. It loads the DTB from the boot image it boots
(BOOT, or RECOVERY as in my test); it checks that a /memory node
exists, and only fills in the bank at 0x900000000
(reg = <0x9 0x0 0x80000000>) when it detects 6GB of DRAM. The other
three banks have to be in the DTB already. Samsung's own device tree
for this phone lists them and leaves the size of the fourth bank as 0
for S-Boot to fill in. From
arch/arm64/boot/dts/exynos/exynos8895-greatlte_common.dtsi in
Samsung's kernel source release for the Note8 (SM-N950F_PP_Opensource,
N950FXXSGDUG6, on opensource.samsung.com):

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x3C800000>;
	};

	memory@C0000000 {
		device_type = "memory";
		reg = <0x0 0xC0000000 0x40000000>;
	};

	memory@880000000 {
		device_type = "memory";
		reg = <0x00000008 0x80000000 0x80000000>;
	};

	memory@900000000 {
		device_type = "memory";
		reg = <0x00000009 0x00000000 0x0>;
	};

The DTB in the stock SM-N950N BOOT image (N950NKSU5DZE2) has the same
four nodes.

S-Boot does the same on SM-N950F: the device tree fixups in its
N950FXXSGDUG6 bootloader are the same code as in the SM-N950N
N950NKSU5DZE2 one. Every Exynos Note8 ships with 6GB of RAM, so the
fourth bank is always filled in and the DTS doesn't need to differ
between them.

uniLoader then doesn't pass that DTB on. It boots the kernel with the
DTB linked into it and only adds the initrd properties to /chosen, so
nothing S-Boot wrote reaches the kernel and the memory node has to be in
the DTS. dreamlte and starlte do the same for the same reason.

btw, the name's Nhân; Trần is the family name, and if the convention is
to write first name first, I'd be pleased to adjust!

Thanks,
Nhân
