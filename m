Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991400;
	b=p6pmvxq+UB0kO5L8caMtDc1hkaZtXOihgCLqiI0yWipdjnkOMhg6W+KgNWDmgFvUzJ8I
	 o5+aZVuNIUR9W8UoOGVeLoVIu6q9Gq/pKCU53yEQTMVNHOjcXtV2YPu3hmd0qcANFTgwl
	 JvuBTnxgJmn/Grt3dK1XgzBrz48ozVDg/93xfbgbCt9zBPtO+6ba9LN095aOBfN/81sYa
	 /43vt8HcrCbyz5/aCy0mvSE2z88uZ5SqoLcH6TXr7+CiBHWJ7cuqcsrOFCsd8wjvETZ2w
	 HGC33+8gcmHPtZ5/cJkAABNNEWcaVaBMyhWQcRi9MQBg8VkFesSAzorXSk5nbXLZEFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
	b=emeUDu/yf2CCR9vfhm0lLeGQWFtrEC8ve0BTcWBa67FrYcamv8ZD1WdBdXYOgRB/XgHi
	 DbA7bk5v0PLttyJxhvtkqyvTvd76DkCSGP3DywZkN9EY4UKybeGHmh58qoaQ9AleW/15c
	 rnpevQehCsPk6KJ2zvZRKE1owwxz/UXxvmSY2cDJBQ0Ydxn0g7zH9QOEZaoZx4ihc7R5X
	 T6mKJHndKukMxmSjQEfTr2u6Lsl2aiHD6eiylGQ8HnBwZwJvLdwLho/hhsSKfpbHGda9O
	 +D3cmwO91h4VvZkcYyLaGh62IgAc9R9TweTsDlpC9uijyw2f0yBNRZqCUja/9M9c0aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMQWgfg9;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AAE606A32C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 08:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMQWgfg9
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so1388703eec.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991399; x=1795596199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=FMQWgfg9Ufza5MksSVOXREguuk7fmboJ/mw1rb0xeAfGk8JHucrbWpuPRdq23IoQNR
         4tQ4xLhMxoi3jWFiVvnxlOw8SrNIWr69OkE2BM8yC5bqik145XrhAZVOO3Hj+grM3llR
         yOZpnt0dLgRkHpq8U6fqmjuC97zrVZEkFT15gLDtieJXxeO1tcrwc5m5iWf691g39ZV6
         muUgqgVaDkUE3yDtm55RdRKQImQ2j0hB3krwOU8bQhfUNPRl+9KmMISkAMPPUyXikOU9
         JW+PA/cIo8J5AW4MxU5HiT+hxG3H9ARpG0oOh6aSuoEdHRVPrk0lANMbG/9O/EATsve1
         fEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991399; x=1795596199;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=GbWznnEDRbJWuObIKzcI5HN2cT7ByPJ8BKT+x30YIKOd3BIU2BVqrmR2ISWBkUa6Av
         6DKykz3LgioBmQvcUx978vHOUY7meHKlblh+cBUl1ca8WSy/f5iTB2kgTzndYhAB3+6A
         CffZVoafBFz9g/kzyBkVRbn78/d7pbKdx0bs6IRamKxqDKK+WokBhg4OZdYGsx//Iya5
         4vY8kTSssIZ71jVN3SgVu4PimQGmS0kjumypWMWAjum+B0tklLirdWqiSilsJ48ZFhOU
         TyB5RH++c7Tjllvh0M1/A8w3AA7eQPS5GZo4gz8kENyf/TMp8ctFIWU9BU/MKr1hf5Yj
         r6wA==
X-Forwarded-Encrypted: i=1; AL+hErHa3Kq1TycKd53zPa364wzJDpsUFfdbpEDu1XwHyt4TSjW8jhaWluhvgMWTHZU9oSPrdpQz/6GiSVrkTxtl9fhD6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LI9M9Unw15tqO/1ozgipVhHpSufoRlqU7BiDQXkin6BR6M0rJ
	VNjIYVbdqU27+zQE10MQBK+qTLYlZ2dyTLXj+CHiUKVBXsVkBodMfQ6G
X-Gm-Gg: AYBFou29Xry9j+IIDkdcuqcxN8SUbt5MRevEJEdIWnHp9vKYlEFOGe3H0WAX+TnzcMg
	7zNM8CtXlXZcSB9+Pk1KNAqfZ+6jPmvhTt0kM9V6pixWQ5pQIP0ddltwI0CnswKA+wZrdHhcFlU
	8kpacDHg88VbR52nDwNErr2V0BWew9ScAXiKN6/99CtO06X4bTABuFPts/eakf6YYwOeIdaGQdS
	Wc9Sn54r5I4tAwkQ5r3eZRROLSbniacSBaHxcwWZpoQODYOxGOED/QJumeH71KEmCn99kr/xvUq
	dvLLvbuiKctncTNABDmrP2nSWbLLUWcjAK6yK6jl6KN0UXNRCHGSm6CNaTG5SiSpqZaGfK9CKmO
	xlyQv0SWi75ozgV5RqStvGxjewbMoFyococU94CyueRrkxKssTyIhurIYwEXTIzXXxQdb78K6sE
	kkQk8Es/Xl1oq9fhBNVKsjmy0OA+hleuDKIBanQLzMs909UCSaVzyKBeYdFtFxWFEU1jF9Y654u
	071CrjC9kIUMA/RSTv1PkEYwebHfYbFXi1O4gOjGyuDd8wDFFFDv2znt78VtpYhcKaC2YRi7Dh7
	492I6dH1A/Vak1kxRW8LTPvIv35qRXCvP70bvK2PZ/LpVxFcFxLwXZK43WyH4On793vVe4s+wp6
	U+eX8Yw==
X-Received: by 2002:a05:7300:df0c:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-38280d307f2mr2424732eec.25.1794991399408;
        Wed, 18 Nov 2026 00:43:19 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:18 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Wed, 18 Nov 2026 15:42:58 +0700
Message-Id: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABJl/WoC/4WNTQqDMBCFryKz7hQT2mi68h7FRTSjTvGPJEqLe
 PdGe4BuHnzw3vs28OSYPDySDRyt7HkaI8hLAnVnxpaQbWSQqVRCCIXL7IMjM2AbM/SB0AaPjdS
 ZllaoXBuI29lRw+/z91n+2C/Vi+pwnB2Njn2Y3OcUr+Lo/XOsAlPMVG5vuqkym9+LdjDcX+tpg
 HLf9y9bSRolzAAAAA==
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
Changes in v2:
- Sign off with my real name instead of a nickname.
- Link to v1: https://patch.msgid.link/20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com

---
Trần Trung Nhân (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
Trần Trung Nhân <nhan.094.vn@gmail.com>

