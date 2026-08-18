Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3113AAF6B;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065628; cv=none; b=Qw6Q2kArp462rhh/aR9BclT1mVdIJsENG7TDCvVpOfzLTZPdAytd77b19mXx6hs6kZ92Upx3bvN8VsVd1m/+mJoMc0k3SGOH0tJ07tEp0T16OxrUa9ZSXjJNunI+7UPWvzLfpMNLtPtWQgj11LXN+ci2DBkJX/0sldmzD8p0y3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065628; c=relaxed/simple;
	bh=r444rkKnnmxJSFdTtlazkLelu/fRcjvBfJQaLoZOfIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ny0iEDaLiS1kMwXWCeasx6sk8ux928drVzNrcli7oYWjvhV+uEL6zqPy3EutK/ghdTYc1rWRzoGryLtUghgMppE+GqCQa5GtP8XZTqGTHMEVRq8DAmx6DqBVzzuPeAEaWzFnr38A6hr3Sy5LpsQn311mM7j1o7cyOoB6qe+YX4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TF3hFp+k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TF3hFp+k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CB05C2BCFB;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=r444rkKnnmxJSFdTtlazkLelu/fRcjvBfJQaLoZOfIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TF3hFp+kE/pEhUDUvChrYWIEHO6VRV9d0BA9/g5+akCy0B52GAc2vAc8FaEELBKsX
	 TiICIV5kYJVcw4cEDpQp0ZP81RHy4FtiQD04hnr1UHD/3zA0DdR3/e3I+mSSN6R89V
	 +OvbTFaHS2EmjQ7eJmy8Q7WH3BcnN8BVFALerXt+fh+lqfuF109U0NjLm1cJPaBF7X
	 WCInUGu215oype16Z2gjWNnVrdG6MnFILW5YeZHQy4jllVgORwKdt+er1kwArncqCB
	 S2wZQam3RegZRyycueJnVoN+6NWfxCLQxfc8ywkU4NSj0JWhJX653vadYwlL/5Larf
	 tUn0BvNdU12Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F43C5DF81;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 16:05:43 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-chipid: Add Exynos5515 SoC
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-chipid-v2-2-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=KrAvbTcjPgbEqmHaN4JftTy05Ws77uQwQ2XXbRU1taw=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUYhckpPyuaAWT392LX/C6uN5uPLPi5/tBVa
 ktbbqmfOgaJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 668zD/0RgG3Qiu7GFJKFaVrk7O9inGucMKIg0JATcjQFzegBFbclxxmBKUxIpPIcHKPvSIcDv97
 9llDqe9WcvUC9HDMvY5tV9yzqW9ZLesUS718CGo7ltIoJnao54yDxAR+NKfAX4DsDAJ2ZuXzJj/
 /Fg7sFZNwkPpRdIMGwFThauaXQ1hEB2gEX683A7S3padQcEa5YNEJVSXoDqPUMRpqQ1eCatgvU7
 27DRSqo5LeaPS8I53bazB6uKGotJV34+3TkGVpBNUHhsEZKiSYPLFmm7PRXImt3jhJ/ksuF+dpv
 ANBaXwBWG5jSHqbvQqQ//EZyCYN1D8wbKcRuJDxQPQYiyH/iyXSlhG499ltMdFCT7CWDkJHrggS
 PK55zp5r9XeVLONpiuvikwk/L5edX7DyqE7am4/QMLWkAVvUnVq9AkUw+q5hJzf2aAHY/KMMWC6
 jkGDoxqyZMLvhfjytmWaFptJ8tq4BByEPTGryb1dHARJiup+IU1aYRBVwKZrvoofZf2sDSPIBIp
 T0fhN9pt8ZGgBcWxECthLhiUGdqIkI6FWjbdGy77RNLcfUoYwDLwcmflDbEnfHPsI8PL+DfLIjA
 w6MqXTBxJmFx2C1ODz63a7E6vKT8J/CVL1tGx+S0+XLiK5FhsGfo/v85m95oD8+EuLrVYS43Mt8
 bE/zwlwr9lSMjlQ==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add Exynos5515 information to the soc_ids table.
The ChipID for Exynos5515 is "0xE5515000".

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 6ef9751e2509..506a0bcdfe30 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -64,6 +64,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
+	{ "EXYNOS5515", 0xE5515000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },

-- 
2.54.0


