Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38262D94A4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769635383; cv=none; b=fzH9rtC9LfbZK0Xj4eXp0GLdMwfWIQoNSL1FeJ+QCdM0+2ttKdHiGINNt7GnIpAvK6TTEGzrYvrEqXStOLNoCrHREmMe1nsngTcxFQw5UvpwQcmZpSBhiBLhZtg1Qqbqv02zl44z5gwPqSxIOvJoJ8LIfKG7p5znjMHIqr3f1Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769635383; c=relaxed/simple;
	bh=xkvBustiBK/RBB5IWlx1FtKeVuaCNOtXeAFFTt+ZMDo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qfjA9OC8O2a2oVn3G/bVdn5BwNhUJQPlFSyffmkfPVM11U7Exg4EOQDzu4mQ0XpQTczp8nO1m2IdEwIyGB1QhRwndGT3OfDjzL0emkVAUOua8kgPnCHKjgmetEwm6s7KNsU9yjendSI6vT2dk8+GkRgW+uqXQBrEWlf5efniMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEeq5eCC; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEeq5eCC"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b7a28264c1so565810eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769635381; x=1770240181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMLVQkjt0m3jqSNYOC481vG6R4cAFLtNHdlE/5eHfzg=;
        b=FEeq5eCC/VjhQJLcUvZj5lXCY5vnUOlGETPevgwe0pX44rhJMk+mN9zvgPrNwGK9+d
         9AbRMZkWfVNcG0Xx8mtUlVPIcJRur0DVHZZqHMCM2cGIk3MabyvM5AeLzTuVt1esii/X
         A2S4qJiR0N5Nz3zQomoyWu8DLyksdz0oY6xrLsE2mUTBXfR8VdtNHGV8GSqgaiL6bHQ1
         j32fIWLjYbeBLiXPTil/tn3ufkMzdgqUXX5Z5BGRtTQTGFJYsPgujMmJ6zrR34zvdlRo
         rHyQZ/ThLZzADAUdI07c3xCAY84ph+WVhI+J5y9ItaLDM9er2uTrrDvxBeyznWlNP/S8
         HT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635381; x=1770240181;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMLVQkjt0m3jqSNYOC481vG6R4cAFLtNHdlE/5eHfzg=;
        b=h89PRqXM9yMjw88ym+2NKPI0v8dkJoPIqfgAeQKIj2rkpSz5/wBlVISM6w/zxkfT/C
         J4nSA1EGzYK1wTs+UXxzO2jn2ZSDZ+s/f+D12q4tcu0JeB11k1txplx4osmRH+o7MIEg
         Vn6Pb9MKIUlcvcyHgwD+/BWkAzicyNCJfQNWjXgS1djeD04kHDyUFhoGC/y7VnRW0fie
         dY5weOFRzpu4VlpPs5LshsUf/FuUHtvdzt2ylZJvnBsQ9D+pqhbCswPxJFg0ZqFJVt7F
         RE5NbDxh6YIOWN7raHx7/3VL2ATplgQZAVWDELsSWYMluAhMb4XdPcXSPDvWl0aO67kC
         ii7A==
X-Forwarded-Encrypted: i=1; AJvYcCVAxpSyMCo+inp15ejkhAkUALjZcMLarPrpJVvWCmDHqkJBuBv/8zbu4qb13TaIGH+2OJrsK6oGt1LmxdO+OAM26w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvx5qkMbJtEBhVdlwdywTT69MqNVmdI1uoHxM6zio1AjYFHzaM
	dHiG0roVQtjUWiVIzQzypjqLiqnMSYsCc4p7CLBW5H++FI99mnluAPF5LFprt7S6btSAARhhlEz
	iDG20Og==
X-Received: from dlbqk7.prod.google.com ([2002:a05:7022:ec87:b0:121:ac3c:21fe])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:aa6:b0:11c:b3ae:c9f1
 with SMTP id a92af1059eb24-124a005f29amr4013133c88.1.1769635380815; Wed, 28
 Jan 2026 13:23:00 -0800 (PST)
Date: Wed, 28 Jan 2026 21:22:53 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACx+emkC/1WMQQrDIBBFrxJmXYsjIWhXvUfJItqJGWhj0SAJw
 bvXuuvy/f94JySKTAlu3QmRMicOawV16cAt0+pJ8LMyKKkGiQrFSvsmrOkNauMmN/dQ1U+kmfe WecDPgLGuC6ctxKO1M7bvP5NRoHCo5aCtNGjN3YfgX3R14Q1jKeULh6SdiZ8AAAA=
X-Change-Id: 20260121-next-b949189cacf4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769635379; l=1872;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=8xH4IQmMfR9c9jcVFAJY2hsd6wxCeTQFe70KrSkvl+w=; b=LZ5VqZJrkv+XgN3hBBFqILY3EJnoB9fW4PusyWmGQVIp0/q5vbTOUH82B9ql04LuwDe4v9Sfr
 hqIIifUwbBTCo0pHZN66s5GMKXPbUPuJGfJQ1GE5BfQ1kbV3gD3zeya
X-Mailer: b4 0.14.2
Message-ID: <20260128-next-v2-1-624bdae8e6d0@google.com>
Subject: [PATCH next v2] phy: google: fix build dependency for Google Tensor
 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The Google Tensor USB PHY driver uses the Type-C switch framework to
handle orientation changes. However, the Kconfig did not specify a
dependency on the TYPEC framework, leading to undefined reference
errors when building for architectures or configurations where
CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
is configured as built-in.

Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
required symbols are available during linking, and 'COMPILE_TEST'
to expand test coverage.

Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@int=
el.com/
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v2:
- Add '(TYPEC=3Dn && COMPILE_TEST)' to build dependency to expand test
  coverage as suggested by Andr=C3=A9 Draszik <andre.draszik@linaro.org>
- Keep Peter's Reviewed-by tag because the change suggested by Andr=C3=A9
  is a trivial improvement.
- Link to v1: https://lore.kernel.org/r/20260121-next-v1-1-c18068b091b9@goo=
gle.com
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2efb9209781800ee47b820a91b115ae..29953c911deda5fd3c43aef6da2=
8d96954a22f8d 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
=20
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
 	select GENERIC_PHY
 	help
 	  Enable support for the USB PHY on Google Tensor SoCs, starting with

---
base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
change-id: 20260121-next-b949189cacf4

Best regards,
--=20
Roy Luo <royluo@google.com>

