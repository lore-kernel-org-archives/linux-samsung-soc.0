Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617B415B98A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783804; cv=none; b=IA6lqA1raqm6lmH9gIcL4vqF3vbNbtYd5XocmxNYp0KFh5kDIXZPC6vKxOIchMeLnrOams8nqrCahMAs0CxzK3zAuhwSL8tmoxICO/wCXI82gOHFTb1sooi1Vzrr045MxbFEpcRKzh1VhgbC2FbJLmKD9UFrcenW4xIPhc2ILnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783804; c=relaxed/simple;
	bh=qgxGtqz0Hm8lEhfsyYOFZ9uLr5Gy8MYtN5ATEsQTVzs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eisIRsJq8bE0whN5nXZfMSj5Nd1i4AZhj8ZfiQWiF9XqWfVxG+RRY16kbW3TetKhJBf+3ffk1Uy8RkahF+h5LAIXWqEhM5Mwrcwm8frTtZXSIcWmXyQKjGgUY35HGmsfPl3p29/QFjHcU8O7Wo8kcCjkhK+aJ7aZul2biBP/6tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh8Ofelf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh8Ofelf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a36126ee41eso92006166b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706783800; x=1707388600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELqpTZvLgMMzm02/IMeIQHM4yd50odkFSFWfS3rIHB8=;
        b=Yh8OfelfyjqLUJiInJH87wphodH2rFuwk0fTEWUGNMCVSo2yFVn9fM5nkapWiPkWew
         BEZw3WYOZG9BggtEeZPzPRoGRyCPsWuvESURIZGj2yf5ILH+zMneQA71vyoByMRICVBF
         SVrKm6NvwJKhgBQXTJxs2DF9+x35vcMmezqfeKdVJE6IDpy7IeK3Bh46lJSsck62BWCu
         riNKUtO1cVVbWoTR927seDAv8EQcQwmStUC2piJuJCRKVx2fD/+GSTALXkdi1+UN1LmM
         Tq/o7xWpow4S6uUpDD3RgxEs3WBpd6eXyGDLHC11N6WiK7HntSxLTlOkX2fLpznfw918
         vlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783800; x=1707388600;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELqpTZvLgMMzm02/IMeIQHM4yd50odkFSFWfS3rIHB8=;
        b=avE0/Qi29bCgLKcqFbS++wSAbDOZnUqj7lorHl5p14D6ed4kPRCQCFIaMfRfgbQ0VM
         cZWSCUHV18Sz9I7246qJGklsNAr4DBUh5gcYAZz6VNaFVM7uWPxuEO0bKqQiDdUW4w/l
         hmqe8zlUNHfxd7F7ACDb+5W6EijnVwpDJ2Hxr9sK9e62a82KKngzhEQdpRRs2Cx7lFZh
         2iTmQ8wJ8BO2iXRstbLrIFlpZc/irhf7q4F6etHrMu0P0pSTZ/EgPLlHOhholiZizg13
         JmbH7NLJcc4uaWKDVY2dRi3qiseTSEGeaAG/RoufhLqzaXcFSMhJ/nu7nzsRiNrH6a15
         GhTQ==
X-Gm-Message-State: AOJu0YzsJjUYuqzdEedSw/jBXE1PP4A+/zpc0LhLHjZ7HOCTJ8tmQ04P
	kG4OeYmijX0XrHObTrGEeHUQ9R+Q4vBs1sorSlMe26SxD/SkD3XSgunzHa3wT8s=
X-Google-Smtp-Source: AGHT+IG51xzHVAwchknDXRBtyIfXiaNx3yhCsqxzIRo2AHV2f7ixQ6e7ZDydPbZDY8bN3iL8mvK8+w==
X-Received: by 2002:a17:906:e2cd:b0:a2c:5139:8b11 with SMTP id gr13-20020a170906e2cd00b00a2c51398b11mr3336749ejb.56.1706783800692;
        Thu, 01 Feb 2024 02:36:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWmc9aGbJwGUYavUlRyMX9smG3xrl896IawCZCtAOTT5UuQQXkuBD41PHVIXBbT8uW9fvjz/KaDJXE2x94kOE415xUE0y6g0/MCYwp7fN/PFCDp39uHr2P8giHMLydukrFG8xEWOKlnu7GZqShsAdRJEukR/hpFXSLuVbEZ7ztWCfMWa1OeBGmcG42jXAxDMerKDHTPo24xhucyZmfinM5aHTTwP+wZ8DTiHbrd8urlSE+nWjZaWkrcl/GJilx9nRfH9EiPHbrE4aDbR5aQZfiN8aGm9e9uvMkem+nxGh4B29HLpMoe9VRUtooFzf+6TUSlbqQjLm5TYLNbNPRd34vpRMZKoadNL+E5hY4l8/VQ1atvR+4kt6Pz+X0SLkAwE9J/X559QjvurlSL7xKjKul+ff44eKfEJbF/yGMoochVwnHon8ISkQTlqjEHQdw6Yc9nw00Y1qwQ38pfztASo4sUTO9DdVzSrlh4O9D3ODEAnI5nI/3IdRA/bGHjoksV8PraE+pOHRqy4J6F06cXcLmdychwPzfzwHZZyawAFMY7TLGVSh3N6yQWQLlBeuCSoXUpmGAWtgVvYIBM2Ai1sMLf83ziqPzAzW6rfJsVpjbYzdy3IxbRPowrSBHdYvz9P2qwSTdQUXq7P53KxeCtLyckBYIJxEtnKPMMN1U2svdvOrLODg1Xeg==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ty5-20020a170907c70500b00a35a8571419sm4552308ejc.135.2024.02.01.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 02:36:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240130093812.1746512-2-andre.draszik@linaro.org>
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
 <20240130093812.1746512-2-andre.draszik@linaro.org>
Subject: Re: (subset) [PATCH v2 1/6] clk: samsung: gs101: gpio_peric0_pclk
 needs to be kept on
Message-Id: <170678379863.179994.10165116011101753606.b4-ty@linaro.org>
Date: Thu, 01 Feb 2024 11:36:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Tue, 30 Jan 2024 09:36:40 +0000, André Draszik wrote:
> This pclk clock is required any time we access the pinctrl registers of
> this block.
> 
> Since pinctrl-samsung doesn't support a clock at the moment, we just
> keep the kernel from disabling it at boot, until we have an update for
> pinctrl-samsung to handle this required clock, at which point we'll be
> able to drop the flag again.
> 
> [...]

Applied, thanks!

[1/6] clk: samsung: gs101: gpio_peric0_pclk needs to be kept on
      https://git.kernel.org/krzk/linux/c/8a96d2701f7c794e45102a9cc7fc4a5c4951e699

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

