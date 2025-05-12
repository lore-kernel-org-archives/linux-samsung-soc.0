Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA97254AE5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 May 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031907; cv=none; b=hUeGlolKE4GHfteRsZontj64TvDxLevfg8p0tZRX5lndzUKcKMfAcVCD4KGqgBaKiac12ROwBjvlk0BsN1W8GxNkElQSLmpP30LGT1rXQxF3WGNlw9QsFD0nbUBYLwiEjTiyEXb9QAFCH+am7Mi7TGYuGYi536VpCNbYYKoDZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031907; c=relaxed/simple;
	bh=k6nyCIyilz7zfov4OFEUENE2DGQbjDDdPx3tbpfgW8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AcBknk9Lkf+/RuHLPRgkJ1FXpM2HkEXx10FH9a2OaYtwBde7uAAnJfzXpKDe5lcJj4kh+4WDQlKOMMTRx26ahO6727Ec61E5Ep/lvPCRHACjrlOrYlPPAP582vlyGNmBg/un5MxpsUZwS6NuT9wQSP4CWvrsKSUUfaSVNe5pjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vi1ZC6bg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vi1ZC6bg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso593929a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 May 2025 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031904; x=1747636704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=Vi1ZC6bga6JNi66kFjfQkulQJxezhF7ZoHiOllcNF8kI/aKLTyf87pw59iwMXXbKQw
         RcRc8OXBu5LN8u29i8PxqRI0TETmyvxJ1HinuDAYXAcGmN1qx0pl+BzKevgqtT0DOOJw
         crU8uyi5/+67Gqzk9edMcwvsBO2P5SR48n0PVJsB37mgFgn+Fr5t0mLuS2CRrH102vra
         Fj2u7+2/HVxkfFV1Ejaw7+KTKFvbZEVsSIb7DlKGai2rziERt/UNwKzxXAUElcULa4GT
         6Bwj3BxeYC5GcnknKU17LpSwyvX2+tJnU8BnYH6s64LpemCKNGdN8qiahykoexxXLWA/
         BzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031904; x=1747636704;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=aB2ApOUPZL4lDQgx9D2ZMmXhCxAYsmAl+Dp6DQkJVOBmiQI3//1rOCvaQ3VGKi7LfW
         n24GQyM/V3gknuA3Lly9f93jf7bysRUTlCSbA/SeFW3b1fpA3VN8DDhcVh9I8anbWH4s
         PIwmUIT/0nMkZr5J+rkCVC1NcrVi11q46N2gyDL42022phx+O7Q8RIGkvTWYhcSvG3Ce
         9hFJz4aIrMnAmU3UY91AU78nJjE4HJggsyBLBl9LKBXiyqyEoyQdV13asFDv31vuulFE
         ToxDzMYgXvbON+XqBKg9HJD0SuVgZ6Php5il8J6UCTugaGQGNXtl9qJA0i2qMjAVQpbD
         mIsw==
X-Gm-Message-State: AOJu0YxNY8FHRrjKLq8cosVm0DUWGdipFfbQacIOTiwo1uQ+FqxmS+jZ
	R6i4unRNQoEMP+RQQZcMe+RHRjDMdQfTVUgRlqLSZG8G1XQ4k+8sd5/MF6xMSZA=
X-Gm-Gg: ASbGncsci3p3DGLoTyfrIreLSFQ4Ub32qbX9HK3iiHpGaWBj9I7AazIbT1soBDHE5pI
	k9vTdKdQG56Y7tq9o8PcBbTcgxH8AhE5lTJ1+l1ucRPcZw5E0cetkUdg9ZaUVnzvlTYMNxdcCIO
	4021WIrPr3aqMWG2kLIXnrPdSk5bBqOZHYk5TN36rmNHpbPs48lZWRvBx+0tFux37P8fHPyya7O
	vTTEGuCHy+ahw2ASuAKzr0lOBWZ2ibmiPDN3gD+o62uRkWwkt/Gl4qIhXBi9Dw1eCppMmYxMXy/
	yz2mM5hqUgELGVsjeNOc37lKebaoQt9l8Gbm5OLrPwQGHbWrj7CubDd3qjfksqsRrrxnNvji4Mi
	A9l/2Dw==
X-Google-Smtp-Source: AGHT+IHvnruoQf/zsWKz811qCbdXO6vDPHDtBmgtxIKDoHCWYrcOhWQOhDK0kiHkWvqsK39CY/vV6A==
X-Received: by 2002:a17:906:81c5:b0:ad2:20bb:1cf4 with SMTP id a640c23a62f3a-ad220bb20abmr329227966b.15.1747031903658;
        Sun, 11 May 2025 23:38:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985342dsm560597966b.169.2025.05.11.23.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 sunyeal.hong@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, 
 stable <stable@kernel.org>
In-Reply-To: <20250506080154.3995512-1-pritam.sutar@samsung.com>
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
 <20250506080154.3995512-1-pritam.sutar@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Message-Id: <174703190180.30824.7869810440516124016.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 06 May 2025 13:31:54 +0530, Pritam Manohar Sutar wrote:
> clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
> It shows 400Mhz instead of 40Mhz as below.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: correct clock summary for hsi1 block
      https://git.kernel.org/krzk/linux/c/81214185e7e1fc6dfc8661a574c457accaf9a5a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

