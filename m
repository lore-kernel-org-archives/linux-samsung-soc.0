Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030497;
	b=tgmAuhuvCPpCT03rqVuDr3d5Bghj06ZRCkny7uZxF46hwiI3E4IW6OdlaLcjVDBDGnhM
	 66dnfPzHd56DaQIflrGGDHYf/Sltcyusewt05sfYmIaRw6iNAjKXM8uAFL4VsvT6ffd1t
	 XNawhJ8AT0R3b1csCjx+6wTblvXfXaNQSpkTZBdjQXh+1AHlzf0KYq50cp3tlZC30W277
	 U2QJB3hNQAWc7AECot5+kbi3PtXPYLVov+7gf+KY7rtUvLzOITVjE5pC4AhyVFgXMHJ/j
	 y5eZ4s5iPWnMlrk1Hz8D8+r5hh10FGN+b00WuDxk9dkD2YfR0iYuuWQHL0tMECu8Jvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
	b=EYoGMnqhB/067c7p3O0Cj7ik8LbHOIIccZ9XQVsAMUCmic8nM8V/Z+W5D3zpznKceZub
	 tgEzPuvC6hcne5DMSiTCVCZLGbCLzLcGh76+tkvD6wNita3Em8wrC1l9/sqqp5ihEwvTg
	 ip6m5M9GDOHaz/PvGMJMXHQJwc8Y2WzTz2uGbeZPB9L/XTdRB9I//xSl4/+4WXT4H+N1D
	 Put60W8q/sppu67qX0QaSZsE0APPCRnk7Px+Sw47lCAABcKIvkIM/br6AOWfO6A+dKBnh
	 EFsDORgDX1dxH+C4jEwCuLz3bZk8iUdUZuiUbPxR/Aefo1l+UxNQjSqgGlpQNQuBmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pn+IUgFv;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843560A5BC1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9843560A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pn+IUgFv
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3693065a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030495; x=1793635295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=Pn+IUgFv3ihsFrujjLWPVEANrB2ZFyUCoWIZUgTylairSLFBYGHxWQI/rU2Lk96xM2
         y39wmWgvbJztJltyJ/DVWgRsvyD89PcpWnPfWyEVKgWhFLwLGaQY2GLArR8qRobvPZaB
         Jt10M6ey0INtGaXCOwP9j2GjW8Whex/NewR684yHuDNJorf7EQavZRfdI25dLIrDftY0
         fsBZh+tD0hQYnPeoPm8BUvi9UUgfXl+IgdhfUecfP7mRLog8L9MAE3TVmSUV/0O1YFRq
         AhGTkiWcjcbyeCQG0JQm9dvzXG3TsOnlvNckdG1dv86hVoa1zxdEPDmh/eqVWK9twZZL
         71JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030495; x=1793635295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=uGzfyJV3QOlg02fybDB3u25jWK4L+quX30K1FJ2Ls4LUmdkdmdvOh9PHFsVdfdjuxE
         MCy8BXlEspZV9Qx4fj1MNRO/PiYz4m6MCgh0S6EGNbC8P9ClMxy6H1HvNtxXPO68SKoP
         3zoFZp6ClKczfi6BnmvITEqokZJmxq/K6g9yqiuUa6Bdzt2x5O2WbiX4vUETMurB7UVg
         IurtjJYnEGnOZ0YWm5beHImqVMQnz8wGfI75AxGMZ7ugqZZxNtQFWYzz2m2cM1jrT57n
         NqnD8B07F/43BqpQdTQAdwQC7ym5dQF3FImS0soT0/ooH7uuiA8YDTCh/c2uPmKT0CpP
         Edtg==
X-Forwarded-Encrypted: i=1; AKwUvBxefFudiUXb8EjEhBH1WJ8KlvWUH95UNiqOd+LjqwN/d9ENmhe7oGHqvUwBJ8d74HcEeXr/qCYH2l90PEj4Hz4JeQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAGhsnducdqQm/izMlZb0RYIWLUoOcgUfoYf9/qp7WecDYngpz
	F79RKcCDdG4+ghuco+NHrV1LEpZaVU8SUfkQzRQtDlDbzJ+lDYZIP0WvrhhSPpWUYNE=
X-Gm-Gg: AYBFou2qon41oGNX7ML9clRUYIaIeCOoQiQG3Mt6kM4GZJXk6qY/MuBP1XytAliqrHj
	nJX7ysl3hlUtdCB2wqfpithuGjvvfIi8BdgHgWPb/m6Nof2b2/KK3Jc9vPMko7hoCfvtL7jeKCz
	qlJdx1p7QPwavW8gCxd9gx1fa5lbv8wX2iEQBDm8jPV594vFwr9LO0Rjq5vj1M2SpwFeN9z2Zxb
	e1kmyDHMXVaRg390HvbHp2ztX2yQQsIu8ajYl0t+EPARdb+esid5pmuBRax3xlz1CVp7FTboObt
	3mK0kdtrzoFx0zcGNWnUpZrdGSSQfvI3QpJ7w+0SGJG+/Z2AOZetbxrg4JV7qhjA7Kjnzzx5h31
	v2/9h6JCRs0Fw5Pt/5E5OzCwO3Rq3hol4+b37ZbWTCts7/HIcc/KBVr2EiopxubISR/h5cLKQR/
	S3RKDDtv2B5dm0e+wkLb0Q4Mcb7sWfl7tlnC28Qj2TZQV+wV9g5yd/PdaUNZDGrC35aZFW1I8Hl
	PQkiC/vjFFqStBIJxKXtBI3d9f5S0iVmGP3a6emgylpVciQLep18NPIVHizQeVXpJBkBews04i/
	t3R8VUmBFGg3bVt+lBt7x6wsgDrAWzHanYlO
X-Received: by 2002:a17:907:7b9e:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c46bdacc54fmr886243166b.2.1793030494893;
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:32 +0000
Subject: [PATCH 15/15] thermal/drivers/samsung: acpm-tmu: Simplify
 pm_runtime_resume_and_get() error checks
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
Message-Id: <20261026-acpm-tmu-fixes-v1-15-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1473;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=lZVnFDVBHj1aJ/e5MIesn7vTgTEf09TNxBZ/LEj/mAo=;
 b=xzafQuLI4krITcIxtfwX7fRea8cl4qpZS/PU5TktcAFB9PnVEMuhm60+zlPME803xQgfWT0wq
 lnW1Df98m27DbAa2fERE3L8ODpFo5YZ7BhXIFwJqK9CL46OS5TS4oAU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Unlike pm_runtime_get_sync(), pm_runtime_resume_and_get() returns 0 on
success or a negative error code on failure. Check "if (ret)"
consistently across all pm_runtime_resume_and_get() call sites in
acpm-tmu.c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index bce4674be58e..7c30401f8fc7 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -161,7 +161,7 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 	int i, ret, err = 0;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < priv->num_sensors; i++) {
@@ -205,7 +205,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	scoped_guard(mutex, &sensor->lock) {
@@ -463,7 +463,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);

-- 
2.56.0.257.gf7497c7d27-goog

