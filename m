Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4533B6F7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802959; cv=none; b=OjAaykQ1s77kyR1T8LWdJzi7OWDgiv8d/0Ej8+S8bag/OpliRjvxU1UEAv0e5zzsIPzO953Z7qrC+ZZ+y58DnlpvKeQye5TeIaOhFY2gaAyjuwvK5eMTiqHkRwF0ShL3djuH7ub1w/NnRvxUaFxT+G63fwLWKJ0iHzzo3HWmHoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802959; c=relaxed/simple;
	bh=RzBGsCn87G8Sx3N+xmIXdtBJ0l0kWfW0p7tCuHwvI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxB6sxtFVfpDg73jVC1XkwBQFwd6r+6d26ygXgILBC/ftX4Exrb4w31WDjSXf2bYodFmCljhLsIkNcRyoe3uLKGYxajUtg+9ezI8ZR97f/tlJjz9SjGn2LOLLsUlbrI0sNUMCGRZkrtWs0H0h5VPJiGKuw/DrD/AACucpRvQWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTnk17oz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTnk17oz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b728a43e410so732801866b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802950; x=1763407750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jumGSBrz6UJPB93YzP/ypMhQMv7kILadjYtPvrV2cZM=;
        b=rTnk17ozRBwpoSJoTMGRHP/mdkG1ZwdxIj+43UUty2dcF+hxkGHan0pyeiJoAHEPEH
         hsya4xIr1KJBlJAen6ShfDd87jB4mRKEWLgfGgocYLq2v7DOEesUuDp4z77d69ltanVS
         ilrXi3OWebiy6izoNvAtyaJu1xrTZ9lawzz+qhZoNi1OA7y7YkTxVMYlob9jgY/Va+i3
         B36ueBo8zG6C2w4iP34Ngbu1HOrmQehv4XbEF1IMw0Y1HcMytnWqDt8MuYHGMxo59KWC
         FWBWarqm5C9lAeaOLZQr5g3SypAhdN5McC8fqliq0dqb8lPnlx2E3YOLeA5IB8Y2I/q3
         RHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802950; x=1763407750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jumGSBrz6UJPB93YzP/ypMhQMv7kILadjYtPvrV2cZM=;
        b=SLfiN22bxnz9bBzqBd5bKnzIJELsaknXza+RhuwFB75aNQE1l6/7qefD8p2PysVZTw
         UqVVGnsh0AKX0Urhasw9bAkzxBvIWgY2s2rgJS2vyc1hrX51oN5NGfcC9lExVlMgaBM/
         CINm6ckLR2jp+SI84gIQyfPel1EczPNjbG9vBoY0VvXm+F6oYNPzxA9z0u+uracXbndN
         c7ASKGJs2Ya4Sjezz8HMpzmFnY29hp3FcNuZP54nIKqjEmc6rNzcu9EvipuHuxTh2IeW
         oSBDPBr8c47Kp67WZLCa3vPr5YctdZvjaZe116liSG720veiWRSmL92EYLxypNTd0ccI
         NGNw==
X-Forwarded-Encrypted: i=1; AJvYcCUBkODprCOz9kvGfsaYmYUVwHp+EDkdIcwWoTpJHgubrxuGg6EgDar1ZVDNtE5ZcJT+/6zVpEbVLKX9XJA1IZs0EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPW/q++LaP57eJZKPO1gw0eC7CJgaZ6f8GvDFKfVrN91cLB7R
	MbK0T5MRKJGO5uKZ2arzzigLzRvIKhHRTQmW78TJPqInYTvBe0vxJw8aSwFBUzI+Id8=
X-Gm-Gg: ASbGnctJgzjUSYJF/WGdR/KRR6ugZ8vowAkWeTmYec+iM5NHIR8l0U8hq+Fe92wJJB7
	KcyQe0cX0bBp/R3EvS8QqXVYQLM8vdaoqA1IdOFJ8QlnPSp0coJl+IPtS6rUgYagc12xb1M9qj5
	kifwSULLBJUs9BCo9uwKlbf/8t6SGwp/M4LWfpjweSAZ0TVi7sztzCwEbI7NbpLDwtF1YwSYIs7
	2u0z8q7fRPADEB8xvFnSuM2iA/JAQ1HScPWDhAoP5yJcefn8jZOrcTSMV+wcfjTS9CdyXzytV+a
	zvpkhW4e8g8gKdI+qkVungm48FihBrior1uSjzfS4ufOQmOV9QQAyXCNuzi99zYmmAnppZhorQS
	P6+sIyTc0/8RjgN2feG1ZUYNL9sEfOAtgQ73aTo3CSKZLdHydiAZVRTY+i7+XdTwdJCYl/2pCOs
	0nVsKznDl4k1ZfIvFBGk/Fk3Nc8LaNvADPiuc2unFbE51KWpAvWLSF/Vxsezct
X-Google-Smtp-Source: AGHT+IFpqR3MayLxCuVGV8uSOt13EYeoXGaPrtL/jHLhv195Pfx49CWhTUu8/3DnrKLv5DW2F0sE3A==
X-Received: by 2002:a17:907:5c9:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b72e036c9e5mr914118866b.9.1762802949657;
        Mon, 10 Nov 2025 11:29:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:29:03 +0000
Subject: [PATCH v4 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-20-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f19140e97b9d7a5e7c07cdc5e002de345aad32d9..3e9da15081e680d7660c60270af54ba2a4f8da1d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -363,7 +363,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.51.2.1041.gc1ab5b90ca-goog

