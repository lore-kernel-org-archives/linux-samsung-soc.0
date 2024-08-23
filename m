Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C513C9C0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398975; cv=none; b=YBVKrcWfZmd2BHmImzbqDkuDD0OSlzziMdvHafj8QQL7c53+69p8GFYIcLLGTlD1I68ZRK8gLzOpa0zMG7Hqkz0dOsrejWmkTtlEXIO7XhA96EA9E1mVCXsSg0yKwsKiK1e0eXzkuQXAUJXwTS2bCOlIgMxnY83mB/CAE+zGZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398975; c=relaxed/simple;
	bh=Dfs/zfxcGMkwxgbZd+pHVglQP7ao1LGjN3pZC7mWY5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X/CoLp0lkM7XeHOq7spA1E5teicdXgRl61bnjnHe58zVTskxJdWGBe0B4LiWm6NO8uWC/Ed3uUZnXqMgp/xCTqpkpeaFln8uK3YNXmnl+mtI3VTANhh7SNA3royBdRDjibQUUUwwxD59Ho4uRyyQiYfA/hnWKJXfd3OidLChQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIky/JPq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIky/JPq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-368633ca4ffso263014f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398972; x=1725003772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqJUdS/YXG5oCOC6ILbFIKEZvCWARj8PtvC4FGtqr8A=;
        b=ZIky/JPqCdOJdyH9MqTB8l9IgLjr2pBZFbb9fDh/Ql7U5N9C78ZpFyqp61oFSILvGR
         QEM2uS7DLu/TPJLcnNpREc+BHf1pTrNFbK4pYJsrpkyriBxXfmPUtU+uDSF9B+llYpNu
         iNiGD6JTVaUx1uZOubXJKf3jbwlFJ7SWEvRs0MktEB8uJgkhf+iy09iFoptkz1rQPjA5
         XUyKwqxQgo7bCEDWMoyvGs/OhlTAU+2DHFF7azZqPK9uP4Tj7NMDwjV89HPl500nBVaz
         u0/IwWZaMlYQnwX/sEi7t7gSkhtys0SZipBO2Xw6FM6gJs5hwum8kjubbUMG1pSPfcLa
         U7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398972; x=1725003772;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqJUdS/YXG5oCOC6ILbFIKEZvCWARj8PtvC4FGtqr8A=;
        b=M1noZNaEbHKgGcMXQAhxDeSN8vMWS2GmPB+6xywTYG7qraEpRC2fUfcL/vwxFjHpA7
         8xkgLLHYomYwYfF9CDUf+inUMSeDwLU5NGgy0O61p75emujw0QsmHxcIzHV4C7KLQi8N
         pSGWVLu5KVs04VzZT8aT4drgwULgRT1yp44URzYXeqN0lHGqFojPxvlmnQFQuoJHxVQ5
         +xNBl4+eU/LP/UX1aA2saSs5Gp70GeSEus8uMeM+KtkhRsfEaF6tLpWzoMIk0MRqvAAa
         cZBN9UU0llaJw+TsvfhOeOmTw5XynxqXlntoe79eMj3FV3iEJcuLHn8IPcl5TBmQ78e7
         79yw==
X-Gm-Message-State: AOJu0YxRs6mqqWGxvzSBbVHl4vhjBDLbvb+jHRwMz6t7f2FENa73iTuY
	KX3YVXsJSNeIbSR5fGpJqfOsdSoXwCldomTwuB5cZHY+o+v4MxOfP471kqKjyUM=
X-Google-Smtp-Source: AGHT+IHPO9pzchQq/4wYPhxpZn2P65ewO77zYxT1lc5yBLDSswOdkRIe+0dRiChQLRf5edZYQVcqDQ==
X-Received: by 2002:a5d:59a9:0:b0:371:8d07:f84b with SMTP id ffacd0b85a97d-3731191519cmr555784f8f.7.1724398971726;
        Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-3-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3@epcas2p2.samsung.com>
 <20240821232652.1077701-3-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 2/4] arm64: dts: exynos: add initial CMU
 clock nodes in ExynosAuto v920
Message-Id: <172439897024.16898.14647845127210005969.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:50 +0900, Sunyeal Hong wrote:
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
> 
> 

Applied, thanks!

[2/4] arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
      https://git.kernel.org/krzk/linux/c/4d06000979cda26e914552d486e5364248025fcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

