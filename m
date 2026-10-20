Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792454558;
	b=NsMwVOPpcMdGbXilr11OZbvbq/Q7EkzW7sc/uSVnwN42KuerNxJNwXGBD8s7QcHPdc10
	 KSJ75voxKRj1e4rNkQfCnRFgsb7+ry2XnQhFtKd8YWWhMFMkvbfHzlXmCgrYxQZP06j0b
	 dMSJtfUiwq22HXkCu+yh65DVlGrr88T1ZZn124U7v1QDuxQKdQw/cDEbVREx76gX5htm3
	 rHfJihbq5D+A5GYCJFgezu5y9XEbP2Oa6KJNyBObnRKCH6gV8gVrCXr6tTS9yA/gymMjs
	 kIJKb3fAvjpTnTTjq/40oEDwvU4CRzxc1UhdUqwTRfvVOn9XcoupBgvJ1dIbAk51aOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454558;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lO+3+LqztB4BslJMVbH4dbcSTzNROSTgAqtqiDIsCSk=;
	b=P00x1Y7uoVb6h/ZAvsdpRRfinwUwKSoTwKX+aIhdqynHIf/mZtIhKgHUcXCOqWl4jhCH
	 0IfCY+S9Ij6n7qCD6Bb9/9Cmn/8Ea1q8GaRDV660BcxnT8GhfCbWedtOXJIwdmmczwUfH
	 7+v2cvOUi1PdueEGIKY7eVHWWyoWdPhGHl4pVg+x0cL74KjyQp6iHDvHCwPYYv2YC/eil
	 mL143iVh6KW+Pnwh5T7bc35ppucTgh5lUP+fqqaO/LJWwVddBot1OaVU4gfJl87/XaE/X
	 iniQCjwmOHd/DsYFKrKfN2sAjbeq4Uw8N+IpZAxhAkjK3ds10kaLy4V1zB694W/v56A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ickVuydR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4838606A319;
	Tue, 20 Oct 2026 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ickVuydR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792454557;
	b=1NZYaBd4qVcuxhrZtpzlqdpFdi2FGFej1ebuz4W31Nnq1neWRLz8ZM6lYhxecJDSh9PQ
	 XiW8K26EeZGPgyJiKdP1o8VsFCbnhpUn7cGO2OlIAQKY3ZHuP6bnjFCFE+zlhvLQYlmV7
	 2qFkKQJ6W00Y0Jfx0N5qcFQiJSoN80Tdp97x75vDaV8rAdMW0L7vNcOnhcRqKHlvIjigz
	 5f885kVe7odgv5fbIn8bepr+eSg2T1ZQdXUf6AHoJAfGfDPuwNk91uyz3sdLfeiYGgP3Z
	 ax6FRf7+vS4Dw1B6JPVZ5W22HdrELnJ21H5Ele+UwVjbLyCzYiHZT6hzmjgcv6G5z/g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792454557;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lO+3+LqztB4BslJMVbH4dbcSTzNROSTgAqtqiDIsCSk=;
	b=UQ7/ubG+WTQWnxpI6lC80nRsN90dXyLoU9IJvWd6rReFjySBCq4Zm2kiio31fZwwRqEX
	 0q89ZSJVLUZW5Ht478Eq4oa2mskugIGtboY0Q6O1WYjtreBP/UD2tltOzu5clPuqO3vpR
	 gxPRXlF7ei9Y7G5kqo+vSEiS3goLxZ6OsV0Eyb6Ew3735X3bULOnw82XB3qS0EDyUYCqR
	 JUKUSo4yf2sXzT50blGA5RhD8vOR1RHGoV6YeoqQFwPrF/GBU27AfLWeA6oz2JqPVlrkp
	 aB2dzSXeLXUbQLaXeXbd0LO9Pc2cFAAvHLKGHAizotvKiIYrSwnrQMwHUasraaYiRRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE4391F000C4;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454557;
	bh=lO+3+LqztB4BslJMVbH4dbcSTzNROSTgAqtqiDIsCSk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ickVuydRBET84Hie5yemZFfCfMTWaFmHgCYNe2hjw5uH8Ip3CN4+l1rcKldMC78Hm
	 Pmw/y3D56cmXGgI3Pto7wJUgwiVMhD2rxC0UpxhKvVXnddsVeck1Okh4Tj2qVVe+Y9
	 EEKKSjdoFCxwRAxHtjf1ZKPfD9UrTjmlR4kY6t7nohpnsGbXg1T73DRSO1qWvipVeW
	 6dGMXhP2zaif2IgJGRrFHk1acyrXxmow+dN7x1CjqgorX4QS+F6XW5+5zrhXW2mAZT
	 GamGvJmK71WPl4RYMO2otXHhrXYr5zQLQkJciTRp61dtmpzGEZWGv/hZNX9YOOxUEc
	 G/fJ2/chxiGIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F6DF406BE;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/3] Introduce Exynos5515 pinctrl support
Date: Tue, 20 Oct 2026 01:02:33 +0100
Message-Id: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
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
X-B4-Tracking: v=1; b=H4sIAJmv1moC/4WNQQ6CMBBFr0K6dkhpgIIr72FY2DqFKrZkWgiEc
 HcBD+DyJe+/v7KAZDGwa7IywskG690O4pIw3T1ci2CfOzPBRZnxrAbjCRzOEfpRvxcJg3U6Ug9
 lrkyRF1VVi4Lt64HQ2Pks35sfh1G9UMcjdxidDdHTcl5P2eH9f5ky4MCNlFjnWnKlbx/8KKTUB
 JN6almzbdsXLHp/CdUAAAA=
X-Change-ID: 20261019-for-next-lucky7-pinctrl-64bf54588925
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=4CKTR/UrVUHdBxRcjY6+8KRZbZVbDeBQa9eE5DqMIL8=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1q+awCvmX6gpGP3Hpt0PsTjwRibMBLQtV5I+X
 6YInT7kCyuJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatavmhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+s4zg/9HwQhJWCdTXqJukDRuhk+vd39ps25aAe
 lk2AQDbmWdvAyE7WJtOe7mrbU9d5ZbtVYo4iFV7x3J+mrpt/bg++9sr/UucEUUGGafzK6QAjfPQ
 ra+iy+mn80OWXWd8iYA74M4m7aumGYYM+RTF0q62pJZiYupOpwnz7upoO9lMoQZhbjCbT6lg+fv
 0QcqwPPXbBE6aHscQC04uwnAql69PulTFvmEETT/WUeJze8xJQfnjIr2kpCmBY628RGwOlTjGdz
 Hh4ByZA/dI55gwlWEp/10Skg25Icr4K5qpwN2pxZxoQzLRBeXHd4evEP3Fv4ijDZM9nLZzMrYyQ
 OK9odh8Tv5xeUlIR8x0daJ1O/WvcopjglPchsZqKM1K0kCTNDLx6SAjBjnEaWXSo5ohQ1Gsqq58
 HkQAJD4UMSUHXTwovAXz/OuZEwSpykZP/20LBwKs7Vz2VLED03Iq+/qReNF1O0jzLQVDk6UsJGp
 AU9wd4jEgi3LowxpC4t9oYoXVH4jJfduQVy5tAUp5XumiQyMJXsgdzerAhGt8moU0dp0iwpQpAE
 1cAPTbGfBDAGR0yJygvfo5/mRPv1u7wqRknXmxbPWwJ78Tyjr5kSniR7aWis79VVjQQ9t4wwplO
 ePr6kJrxqT/hdsbHayArzsQnn6NWuP5F+h15OAu+wZ8BKCKzw6D4=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

Hi there,

This patchset introduces pinctrl support for the Exynos5515 SoC.

It is very similar to the other Exynos SoCs, therefore we reuse the driver
and for the most part the pinctrl bank macros. A couple
Exynos5515-specific macros are also added.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Remove eint_gpio_init, suspend, and resume entries where they are wrong
- Link to v1: https://patch.msgid.link/20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Aiden Isik (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos5515
      dt-bindings: pinctrl: samsung: add exynos5515-wakeup-eint compatible
      pinctrl: samsung: Add Exynos5515 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 119 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  20 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 144 insertions(+)
---
base-commit: 993e1bec85faedf90c5d27480793084e54357c09
change-id: 20261019-for-next-lucky7-pinctrl-64bf54588925

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


