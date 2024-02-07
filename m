Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974C811ED
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320314; cv=none; b=f2RmAtyylBFev3zV7jryF6Wj5UWy2lt2VrWfWUw9X7yJRCQ5MUNlG3HVs84HVeVyt8VVqaPiAv2r3mVZGXvglqvIoP2jn3166Y+bC49VNp1vgNjS3MCA8OtUP2c5D5eK4fHj/+vx6wK4V7VRK4M8Kon+RBxxm1NrI4xBHAQc1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320314; c=relaxed/simple;
	bh=g4C1H2tRbUr26PzO48R96RGinnnOrQPd2HHnIE9XLGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTepxtL4k7a1r/1aeSMGFVtoxVGnLdDEC8+Q1hn5P7EZdpc2HckHhSPW+Vqpy/KIdzaMT2RB2NF3wXd87mO60EOZ4H6/OMVxt86oHzA3ymuOn2Cy2vsx9hrGDK9YANH+qLqcVWfK9trjptnaIhfdmxL/fbyx501a36L//Xulqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v82S3ABL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v82S3ABL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fff96d5d7so6642845e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320310; x=1707925110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxw67ZbKRim8/vd2giQQBfBgWS65HZ1FfeC3qtnVmQ8=;
        b=v82S3ABLb7wTYPMLxQgln4dy0n3auZ/Isb7oS2m6B7DZ6RIUp9HcO8NgG7S+zTf2f6
         jIBkOEbz0j+2LS/Teeyeejliwi3r7rvU4Wu1CruhqVlIe+KqwBFwTqIH/cw9+LswRdQw
         k5VX7ZOvt3gxY3jrBClC9O0rfjBRjOaEL1q0HieSOuNxY7YGkkJK6M0CIqah/7YOMt8C
         dyGdm5JfhDUgNA+Wj+G+uqE7vzheUK+sGy0jp3mC8mM52N1NkBGPkVb1ZCBFx2+6oPAA
         5BA08PEdcbSRn0esCuUB3FJ/bJTEHa1EbMeUEYfNTHnykIQYJDm3Zed06SVaUlVJdT/w
         p1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320310; x=1707925110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxw67ZbKRim8/vd2giQQBfBgWS65HZ1FfeC3qtnVmQ8=;
        b=IcicW6VocSOZ0uv1sfMIzCDniX0VCFOslJLsQ5LDEXzsDexghWq53iz9BHqU+WsQ+o
         S+LvMFqZdYvnuHhES6RHTP8FPTAwR4GAAajBX4Z36He3TlSLWgJNIHxLJBeXxRAvRL/h
         TOcCD87ds7NESbBxmnZquBE551xryP2SGxU7iCydc9iU676YRCPFS9nnOQ2MoHqaIlFW
         Xy30AEWIhLBVXWj/Wgw+nPzolrNcnH+YLq324tyInySI0mc4UG0XX++R/EV8lHGQ9xhB
         QzXzDwXZKybkY2L7zyEzHnmJvC1z8OAwR+MqOjDXekAGLo7R+jvncVFXoqvB1HGGzrnA
         kb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6q6aQD/YXS6PWoXw6oL2YwuBFoh1KXYXQUlIC+tp+YTPY+O6/mg9i14JddGOjQobPBjrDoqB5tcHCx+yq7W7iNDkvhV8mXG+ONAXmsDDaIZc=
X-Gm-Message-State: AOJu0Yy1FlmjbZm0M71N1L2wjZTyRsbFEoeuzCAHejoXEcezGAMIrY6l
	dsWI5vXpswczFVfvv2oB8bdlXzFgjnKZ1yPnzf4cZqtAPzD9DD4G+xzvSLAlS3I=
X-Google-Smtp-Source: AGHT+IEMu/cXGU1ArBvF2FTiayAOgA6TuDu0/ZBQUhutV6196AOaZPjnbnOmLOArK4yVjbmsow1zrg==
X-Received: by 2002:a05:600c:3d8e:b0:40f:e930:9eae with SMTP id bi14-20020a05600c3d8e00b0040fe9309eaemr3649830wmb.3.1707320309569;
        Wed, 07 Feb 2024 07:38:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZZjAmcOkHoPQq6CM01upKIUo/pCCWeFBeF1QcgVp2d2ZF6XtnKnVUszDKpDtsU1xY97s/hxjAPWXpE9ovntr3TuwdOo9r3ees64mmSUoRBhtyzo58/oBfHxG/5/sBJWa7Q98/FH65tg4bJM1SkFi1v8DHv7ui0AGT4IDjBT55Xt1HO6xhTX2XWJzdkRIwn/ZBCFWKvfNuTG8wyxj+cDu/iOv6VYK91xpY7BaZgxImXmDNmKsk6EpCExjAv87bfuJARoqVzSd9hWO0xWleoYZtV+aBa2HF+1edRQeokDGqf24vcF8ACrvTWgqbiPWFTr7JZ3PFZrL5ZBAI/hZLxCC7FVOvyzrlZ2UgviD2h0ukc8+pdwmpRO/4qKcaYJ436V6+GCez3/FYGgHuSDx+dVV7IaAMvOCStXstwBt3LTfklmtSqBiRqsOUeWzDhUVWvCZt71U6svDC8iX71auMNQYwqGx+CbCHkRMTZ6ksVfS9vytFcYyKCwi/W0gDTvcdafAy6/uhUFUb/9XfN9ytLIdRaGdX9uwIrabNm9oPRVqsuuwfLSOazttlDc16ElLxntKfmt6aVQQemDR2M1ALo5uA3YTIcqYU0GQApWkwX8es24d8oXrZiIkxBYJP/DDnl74RUc7UAyoTv7CRDgn3NQtOLT4pH6plxkrqMJQDDU02uUKo1lsA1qA2PfcZu/kVWrRqCA==
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b0040ef0e26132sm1307678wmj.0.2024.02.07.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:38:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 4/7] dt-bindings: samsung: exynos-sysreg: gs101-peric1 requires a clock
Date: Wed,  7 Feb 2024 16:38:16 +0100
Message-Id: <170732026219.120770.13575234760770994560.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201161258.1013664-5-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org> <20240201161258.1013664-5-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Feb 2024 16:11:40 +0000, André Draszik wrote:
> Otherwise it won't be accessible.
> 
> 

Applied, thanks!

[4/7] dt-bindings: samsung: exynos-sysreg: gs101-peric1 requires a clock
      (no commit info)

Squashed.

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
