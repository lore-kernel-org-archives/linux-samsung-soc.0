Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF02E62A9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317070; cv=none; b=IbnQw1vrgRhfFppQ09GJR76SgI+63Kwu6ZllfzPYRC9kRXpAW4f/qTyRSZrB2D/huawovw+RK6OIApR1b5BG8GR1KwUvdLk8lg1e7iBtqz/re0+Xsr6XoHZC/fugClkaLQUba7OuqChiy/WpL2iqjeeuxm2POMuVlYstxxCvUh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317070; c=relaxed/simple;
	bh=npgqeyJYtjMo1K7oEjKm+5dN1DpSLghDGmFXM3/+hLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S3kUjZNp//TjHK50Xf507l/8QJ1aoqIA/Tppu81HQWALXobYP9x/PZKqdsw8ZdG6l0ODU+o/x7mf39f4xKj34++nANw+1emJzucLK97iRquEPeyRN12YCyQqPkMowbWIAUylGw2O9G3lQRO2AsiXSgICp3WZzyrFCoUBkRN3ACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tqe1ZA6c; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tqe1ZA6c"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6285612382aso46508a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317066; x=1757921866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ihnPj/Q847d8ksRu6ToPjh3J6EYfnXIG0faI+BDt0=;
        b=Tqe1ZA6cVjwTto38GIJSCEC9QGXihI2SzcsCNgLbf/xTgxEXKyWW2MrhIjON3rmCoG
         OPFLLn9OdCsRHvscVXwX6oxJdC0SfrIfl1svSRUrqUaVcZxRQvF4L/iOQ1Ouf3fIEP18
         eXc+bXIOjogqqGePD3sM1xu8J6bDqYR7dtOhyzhqxDl9FUdXGqDbhXICahPDxZ+M0hzq
         OxdF+4pEhiusblsyfOjlHuf2Vfpdoxz1pICU7kNvV5Q/RXqjq2xTt5AyLx288hMvCKuk
         P8MzfhkKIF/uxXdaatQmSds4ZkVACHBe3bRCV5SLy8gwytyilBqTAqQjOzxYyltb02bB
         yKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317066; x=1757921866;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1ihnPj/Q847d8ksRu6ToPjh3J6EYfnXIG0faI+BDt0=;
        b=hUTUw+iAReRzaPlbHefuj1imSSFo/nkbwSOWxtptYI2ruJXuS0m4U5RHx+oh0taYWx
         dXyBNUfnXv/hhpx+9KHAR/7OApb4XT++2INroNm24hnk1HvH/M93nJzmLUAlzzZcb9Cn
         EfhPgVR4Itwy5RA8q5/rEEhTas71tbJNFMHQrCWEH42vKKgqUdU0TJfmYu+XBZ/1Xot9
         0MOswLixWcU+NcVIv2oCNowcxj8AcA3a5K/j2GOGJFe57yC3WcPYzceQyDFgp69X/Z2x
         XArvNeligi2KwrqaHA2ze2svReJ0GLmxOsqnWEb3gYMKVxMY7uT+5pnFCRcfWOA7OUap
         WOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHQ5j+jcr1MNA6WsXUAapy6TdM9nvA/+TMDlvAZvBjcYUDqJJ+UjYLe41/2QHe0zDEzl58R0OzKvRZW298fxgdIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpVs4kKObPB+pfsZY5GUP1cTUNj3GcCSxcgo/eeDDeHDb+aBZ
	1STegQ0q9Hx9WoRzu6vLkjtEtK3c4VtMYODQzwsow3BDt5w3zYMWPZhpPHKmmR02SXYjpOB99hK
	2ja//
X-Gm-Gg: ASbGncuQpVTfFGu7NC6ElN/H9IIJk+wYrFZlp6lTLmUQeJX1PIjNmOYN1SH9IQTzqrH
	TMJS3mOpmOotRVV6hZy8YymRQ1DrYJAPBoMj32+Pg5HFdO2puwqa4qCs4M9qsXNJ7my0Ldvv6tL
	7V77O20iYvH93wchj24QCkiZBBE1qaxOWmWszyHLJgdLPOFmUK3FM4SqdXPLbSBQrpsQ7GkQW/N
	InduOJFc4odrZFO/FP8fVZqIH1Koo9B5bCI3uUE+0rCXLRUHi3p1u3HIfJ9E0Z7WxWx8T3MdQBi
	hfFmAqmqgcErewA6CoA5wo3dlW2fLYtVjMM5S9c/f0u3BLfOCn/VQDf2CvgVTdIdsBBNd/UNZNr
	+2vDp7Qccm1KqRFPqdF5iQCxnpGnCsxDK7cWCvOjwBjwgBgyOlNqhQncBK60B
X-Google-Smtp-Source: AGHT+IEwOfCfMLqhq1au4x2wehLLoFF6Zs3TLFmLiTfUckQkop+xb6mWxOrGK/1CnN+pfhpIuxlJSg==
X-Received: by 2002:a05:6402:3547:b0:615:aec5:b595 with SMTP id 4fb4d7f45d1cf-6237adca141mr3186598a12.1.1757317066001;
        Mon, 08 Sep 2025 00:37:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7edcsm21955357a12.6.2025.09.08.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:37:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
Subject: Re: [PATCH v2 0/3] exynos5250-smdk5250: describe SROM controller
 and ethernet port
Message-Id: <175731706457.18620.18138563656034990579.b4-ty@linaro.org>
Date: Mon, 08 Sep 2025 09:37:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 08 Sep 2025 09:26:54 +0200, Henrik Grimler wrote:
> Based on smdk5250 description in Samsung's vendor kernel [1] and the
> u-boot dts [2], the smdk5250 board seems to have a ethernet port
> connected to bank 1 of the SROM controller.
> 
> Unfortunately I do not have access to the board, so this is not tested
> on an actual device, and based solely on the linked sources.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: samsung: exynos5410: use multiple tuples for sromc ranges
      https://git.kernel.org/krzk/linux/c/31f5a855f706f8b14055b6b4df083c3997e42907
[2/3] ARM: dts: samsung: exynos5250: describe sromc bank memory map
      https://git.kernel.org/krzk/linux/c/6016813c888ec7d4a1f592eab3aebf289a42e865
[3/3] ARM: dts: samsung: smdk5250: add sromc node
      https://git.kernel.org/krzk/linux/c/d19b1773362adfe8c0d5ccc4faf6aea0249976a6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

