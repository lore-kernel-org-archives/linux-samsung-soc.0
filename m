Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641095B671
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307496; cv=none; b=i4Cv/li5HPZ3fkrWw+vXJsm2oEaz0r43Nl/pCxaY9MYdu/zsR7fvRtKjBB5OGK0QhDifkebEgjTG4DF9lA/ikT9RFmg6p9Mq8cuC5rau5woOS/JXS4fvGar/9zJqB9PHJnFt+Vh2ysNfrwEPx3/fI0t24Lj7rgjXu7UqRZVGoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307496; c=relaxed/simple;
	bh=ndhNV4HBTo+8b5MlnFEeygRckLePuGteV+8p8h6/7hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCMiLZYmEYaVlWi7NrV5VzHXTadCfs+qa39O67Ev5fvQDuKcqYytXq1K/3D+JT9zujlrsj1ywzi1SmRuSVP3+Ujz6pgDcBE6ByOIkIxglsNza4GeU2SrWWwNEKnEZMeuyC5JaYrwuYCqOh+L9ijYF9bFS/mpOihLVrvv9vUqENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wyd4CKhD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wyd4CKhD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b40208735so399856f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307493; x=1707912293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esOoTMwtz9mK2VZUJDBgnsqINevzj8Tua/LgvZgzfIE=;
        b=Wyd4CKhDvLwiQprKGAsL6MYYJ3DVRHGjRM8lwitH5tGtCXguQzg9IkYE8qmeUvSZ5i
         9HpxWBuHr79MjKjnNsGSsYHDRdU4DLRiAAEPzioeVVeByMSDFhVOYs7s1+uUWDAE/W/n
         B+8X/fZSdh9cTB77mfvvo9Zp0jD8GSeoznJdbcYhcwMFB678nKM7vGN2rS+4nAq7zTJx
         5sprnsgxr5IHzPhE3WnAHMYSEpVLZG4wcXbzHUrp8gzugA5CpopVqvwUg4kBb3UOct9q
         RQFKPxHSY9bh9eoQnCh0Y14yLFYy61kJYFBjYqHBLluBHhIxLwAmgj+tI6pq2LMRHBJW
         oqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307493; x=1707912293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esOoTMwtz9mK2VZUJDBgnsqINevzj8Tua/LgvZgzfIE=;
        b=bNHI2gTkxATjhW2mcCvc7QWpojPYcXhf0sP+v8+Ei7SR9+Mb0kQo8VJBfIsahCPPXL
         6jShKh9W/UUMojdEljEWwymxh+8LEcLx62/LqjgX4M8iRmC1AcqxGkoZUnAQY2sapqeU
         ZZf0u1PGDWGxl9t9OHSZ36RDHukZEI6KWYANrJwClMFb4mxCXrKE6aQcTfloGOWtZhx7
         8AOSj/9Kqx2HA/8NPnLeN1CyTapveJw7VuM/MmxPDt5dpjw0wRvPz4Xq7dSdMfGajbPx
         wu4sWw8hTiZjyPPKXwz31urALAbdr7N+NKzfZrR8D4seJ0C/G9fwsBY9nji+ysEvUjhq
         IhMA==
X-Gm-Message-State: AOJu0Yyzo50EOI7RPCQ8N8j22JSpd3LOa+DUQIbjF7hnWs1z/7Z3YsCN
	fyxA6qeiowh2HBZYs+8q3xHpjiL3HbCujV/ixP+/GWAr7go1VQqCsPGohzBIIys=
X-Google-Smtp-Source: AGHT+IHNYokoEWrUMav45IyumWp2ABhQV7nc/ooQblNWaAvOKDxW2vN6k5GYusoa1cL9/U7spakTgA==
X-Received: by 2002:adf:f151:0:b0:33b:4020:8710 with SMTP id y17-20020adff151000000b0033b40208710mr3001464wro.61.1707307492917;
        Wed, 07 Feb 2024 04:04:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaal8oeOj9vES+9cljMw75JIEHiHMH3H2LXvh2RoTFVHMIyKN9cv6Rx4JqYjLBbgr8zJ1fECV+9sBx5uJEneYgGhYxv+sP1lLP3Sv2/TK8eNZh/kPkCN7XVNJaVpIaZ/3DpmTdMDbkH+O3hjPUrnigL9fUh0+EewK4LyupWyhsgqttJgx2/abu2cLoz8kkkcHw8tjSw8AVFKij6m6P7c9UVgIilzmlrhMyQvHfDmetnxveqpn/PlnYPVLQeUtgUdMFH9NjLdxIcD+uwQr7ff3Unjl6CbqJ4ieTj34kZY/J2GKprMlYfXRZDH3bPw7sY+MVDxWnnWNUzB1oMDM45qMphfUf9iTlxHEWlCFPjP18iIeCQ9PdqjP3U2zLqhOKyV016trQ7AX6M3XWCLgr8tXo3hA9OaTCdWet8K4CNWomLFogCYdMOSZIAcxjxAOT57NppAnEcGxegzz1Dv7v3wEB40lJEL9F5qWia9kCfaUTJbk9QQIV98S9UAcX0A==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 15/17] spi: s3c64xx: downgrade dev_warn to dev_dbg for optional dt props
Date: Wed,  7 Feb 2024 12:04:29 +0000
Message-ID: <20240207120431.2766269-16-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
References: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"samsung,spi-src-clk" and "num-cs" are optional dt properties. Downgrade
the message from warning to debug message.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index d257c4f5623e..8ad28ec3e6c1 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1149,14 +1149,14 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	if (of_property_read_u32(dev->of_node, "samsung,spi-src-clk", &temp)) {
-		dev_warn(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
+		dev_dbg(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
 		sci->src_clk_nr = 0;
 	} else {
 		sci->src_clk_nr = temp;
 	}
 
 	if (of_property_read_u32(dev->of_node, "num-cs", &temp)) {
-		dev_warn(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
+		dev_dbg(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
 		sci->num_cs = 1;
 	} else {
 		sci->num_cs = temp;
-- 
2.43.0.687.g38aa6559b0-goog

