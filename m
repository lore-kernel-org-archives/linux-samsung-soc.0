Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234620;
	b=5sM50uCb/FMYTAuwkfTPrNamF0OTTdt4OVbp7GLfsI2ofTtTKDQGeiKnHeblV2wli9V+
	 byuktxb6mER5k4Fg2kHF/ayvpWZcrN/F+L7P7PYSy1oh2hjS/nmnvvM+4Qm3WIxIgWUPQ
	 MOveFy5ZH6j5NeLK5mcOqINUWjXkX0Sd3wVPtlfbbBzguBtaPJXbCnO3mQd4wY5RW+gnF
	 L2n7WR3h2kMyTUk7aSXgqjFHvBDQxI249RCpRXX0abUXj6ZeeXvbht6ngj48wcDR9iE/M
	 tlALH1xurB1ZIVMnWs58gPTuDVad3yOpwSyA5dcBpNyr7kFUNicvuhPajBYIuYQ/0MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234620;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=SVWYYLhxeEIhjDuhTBIlUZL/L6SyEXLXw2BhtSeMLfk=;
	b=VWUq0M+CIimrvgNgv/uRiZ0COJ0gVJYund1iltQsjmsWdiULkZOGKl1tj0wtEHauziZs
	 sBmn+5vml1PO3iy1Gh4AH4/Ey2PS8W+Bq9CvuA58hMHfFeG7VgjyuRZNWroQ7w96tR3YG
	 Cq5PTnMokQnnhuDzpG8Pmj2+7UxEWpQjxlIf1/Q/dOAnP2gQ3s5skLQOlU9A0pgWg5FmO
	 BU8lJvx14WMH3W/D+5Vco5uSj2xhtJCbXi313FO6Eo8Q/Y5bIBpmMjedwE1yd55D9OqsT
	 1NaSmIBq2sl7hV1eKBinUAmTzno6vkFc5UEXZ8xZ6CfJQP5j5bkSCrqhYwZngu5D5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm7J10wM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA89606A333;
	Mon,  9 Nov 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm7J10wM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DEE1F008A5;
	Mon,  9 Nov 2026 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234619;
	bh=SVWYYLhxeEIhjDuhTBIlUZL/L6SyEXLXw2BhtSeMLfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xm7J10wMj12w44NK9f7GVywB07zNdzQmqnyvrSOaL3WiwURoulSVND+vccHcMiRvz
	 0TUtso/FoX3DrzMQiuQ1KQDANXLiQak4DTfzi9hOYavJ8KPP3QgkK/FDt2OLJG4ntw
	 TX6snFA1fb0kmiK9pL8aDslQFlw5PhfREauamO4BrGXt22GnXXfRXW0M3urVLZqZQu
	 W6aviJa6KEtprUcsfgNIGyx+lHSJEnLLKEeKYYMWitiocXpT6WzY7YeijWvTL/ei/g
	 veKsVjNHOSb3x6M8mO8fFDzRY/PEcv89UOpSTBGeIRp9lpv18SDRWwWbk1yzQ1PPOJ
	 z7dE78pY+6AeA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
References: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
Message-Id: <179423461620.181759.13684411783134376117.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:30:16 +0100
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
X-Mailer: b4 0.16.0


On Thu, 05 Nov 2026 20:29:27 -0500, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().

Applied, thanks!

[1/1] clk: samsung: exynos3250: convert to subsys_platform_driver_probe()
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

