Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840771;
	b=LHXCCXm2M9wyeKQN2C+Sbbz3VC7RFQWGLcyB/7Y90mi9YefIyOKQUEGQqo80SXdgYObR
	 XC7yKz5iBk7pk3EoHj143OEUJrVOHvLA6gW96Y/fIv77FgeByYCdbi3bB/OXVHKRMNKI4
	 ktaK1ilb2e5qgxKTrusrSRueyxgEn7VE+wAmFP9s5MutuSpqUU6ezn14uQaF1hYu3nG5o
	 8BmSujgeBThjtYX90PNUzSZbhDC6nzzEc4yZS7nPuOsdKFJm+N44BBvAFlrp35psydSLY
	 9c+ZYPjBJcxnH67fDEdB0517yCWQPFkYc04pHJsFlutC+X/XMpKJkfupbJoj6y5YDPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
	b=4b3+9BEPYtWQgSg92u/BbeWaHzaaZcZpg0DeR08zO28yxIDa3ZbVQmMhQ/2pV4t1TRf+
	 ILt2QwxR7usq8QGqlWYU5twtGJStjt1wDpA0SHPOUFs22SE2aCXF86Ipw7YU+QCMXfnZv
	 zgfxwNihbUP8zHUyX3WCTF1jO8wnwUggT159poMjYgf/YJI9WRNcC8hD5xgl9G92/vLf/
	 0m6qjaUZvwz2yJqyQGSt9PGK3EB0ZWop/ATrOZtLKocUY+Mo1u+Icq4TUfV718NOol8Vr
	 za40S7ns0rlE4IHalORTgXgCyGd/pl/yUROw3kcVBkRIv97NzQrBFtAcXJ6aYWFmZFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25913606A323
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25913606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3321705c88.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 06:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840770; x=1795445570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=tRAVzwhyktdqOvWHpQdxG5sbdIMyaBiNIGxVgNZFrga7aNRFMoNXwde9T2fxsiB/mw
         Z4fwtUpZixvFTeBoA6N18nQ9t9T0OBAbUPklo1N97D9JWaSkSNIfUH7t/9MigK8cG+oq
         a+UYpYW0C567CI0dCPwzU3J0p15EqCETaTNxw16bMMcnzXjOQqNdY0EYTssU04UGLeBI
         y/tm18FdC0bvXJTXbT69cEc7Na7NO4bH4PcYsxF8hkiyTuF2LfACQS51xAFZqtA+yxI7
         v1ReBP8u5oDreaiLPSUh2bEjSWOy2piRrBMBXBC/PJupTcZ+skhvoIQsCUN930VFyXPH
         3I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840770; x=1795445570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=tAFMuaAM8DIJf2T6wewQjunx59J6Yq/3FCK/xgYsxMzPxvHnBcKsrVlTDxA6Z1THDw
         dFrp92kfNCSHTh7sxd/yntTNHHWeZXPv1e3IFV9tS4hlicX/IXT9UMjTJifhvAIGp/4a
         AbrRtDOf/A06bzCxadQgHHwuil6zpYHe/ktgURk0Gwl7dljijUlX0uoP/2o5JSF12XvM
         ZE70s1tbhRGgxKKUjcTo6HpMzMrY8GRV0nKPJQyrewBsW2YL+IVV08ztO3cfFVdmn5tn
         BEVGMHeNrBtstfKXL88v7+lg+e3nTYxW4xTdZkM0tNQUit66MBmyG8cd5Y9GkE/dFqGJ
         SvFQ==
X-Forwarded-Encrypted: i=1; AL+hErEXsIDnFA2IJB/sCOfbRsODOaz8BgVM2BU3BKSFeJVOXHhvUxE6qG5c06wUDcZekFs+i/zcPz7yqqA7Xee5p5oBvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+FSYeaaKJj2oamj891aHscJFZuIhHFEe0kDW61jnCL+P55S3Z
	5HT9SVmdn+bWSyhLS4E0zgZ/91Y8Bq6yUYUxzusV7FdAIvs2X7GzuTs7
X-Gm-Gg: AYBFou36Xsqe7JwpdRAvzfHj9Vq2djJL9roHC64rqu1PY9nPAwWl8T8H41yrtXrcvm1
	Q7JrYkUuIS4kTsFiF+eA+TvBmzs67Hz239oamZVvOqFlS8mB/LrXb8Yt8X+KVqagCjJP8lgvEja
	tjyQfCWM5F8qy7eHwPc4hddty8vjOhXIHJAq1W9ivRFk67pbv/vZjdiP3l7hdmVAiSBkwWDsJEs
	jn1Of03zz8XDB7dYOEDhDA7eHO6beeM99iCA1z0z+VeU7/dSTCRs8WtVdjpL3wYXAaKVDeLUIAj
	ZKYDhRXFRZppZCxkW6toaztcvTpFeJ520MLCceq9wyDV9wf7Y51OL/5x1GK0SxOpNMwQuoxcb9W
	ninGqpWVx6uyFzgyCLQAxw5+8m1qWIOBZEVx7gNp8Yt6VIkzrNySWhXtIZs8E5s4XOnU3xdqMXq
	ctBi3DIEQGlXXfMkPybxbl3/Gh2NsEjlUHb6gF2ujFxsoItgYdWE2bgsRWP4eAvqdnMvr2MS4o0
	0OTrdZ4X+jdmiJ+yhszYRffKLuhVj1EBZiqV4QBEekXtovG+vx83Z7MsOW0IRUKHqlDRou9Priu
	HJ3OFIKBUB2ePmjncGEn8EtUJgaZybP1yjeMhmDAeb//bu8=
X-Received: by 2002:a05:7022:7f14:b0:1b5:1c22:6fea with SMTP id a92af1059eb24-1b53275f63dmr2698971c88.0.1794840770041;
        Mon, 16 Nov 2026 06:52:50 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:48 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Subject: [PATCH 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Mon, 16 Nov 2026 21:50:32 +0700
Message-Id: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgY+2oC/yXMMQ6DMAyF4asgz7VUZwikV0EdAjHgqgUUm6oS4
 u6k7fKkb3j/DspZWOFW7ZD5LSrLXECXCvopziOjpGJwV+eJyOO2qmWOLxzL2tMYkykOLtTBJfJ
 NiFC+a+ZBPr9ue/9bt+7BvX1jcBwnMK+8tXkAAAA=
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
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
nhansp (2):
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
nhansp <nhan.094.vn@gmail.com>

