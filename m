Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628A1E86E;
	Sun, 21 Dec 2025 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766325174; cv=none; b=itLOMFDs2oizBgfKrQe6Mfepy22hemRDixhaJMDN/MQh8n+MuxZCauVtBsExpjIDwcn/cXWlas8jY4VDDAU886tBAYr4DL8imCvLCZtHdkEBcR8uwNBqCfeWSTJHMZxet7nqEUr7oynJ0pu53oi0QiNCTrKm+XDfGrae8en+lU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766325174; c=relaxed/simple;
	bh=/24ODsP51o0qqTwmmiMCCQNi1FpJhNQSQeQadjdYgQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oM+m9Zwd3G3V0JGp/OTUMMkmwJBdK7e5pbaIDFspFZZqNNHUwbpddjk19Yexuo5FfabCrZCBCAPL/GtzwDzyjwWBPGF0SYx2jB8izIZQcn8KcLdhhtbtECvstkZSQ7j3rTZCDCU8mBm7yiAbjdcPDruse+Rtdvtl9R4rIHMCtqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1ujjf31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1ujjf31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199C3C4CEFB;
	Sun, 21 Dec 2025 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766325174;
	bh=/24ODsP51o0qqTwmmiMCCQNi1FpJhNQSQeQadjdYgQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a1ujjf31SAsrUBQ7M2yuCs/P0ZS7RJJKJbOGYiIHW6kmA6ChF5MO+vqpX490i4wpr
	 AH1SnFBxv5FYiCsfAmh/ZyMAjUSitEbuB8+CngW0RNbi83TurIvL5z8zQio8iy/Q/8
	 C7fAhR62eFZh9l26tBhHh5YujwHRMuxltA7+bLiXr2bItLL30eJKDnO1F/0YqpN+nL
	 uodq8sOvNsQyfLC4nblA9I8S3s3cfgCwFsRYCYOD5aFYuMkESreXEXIUBALHtfHPtw
	 SKYPP699Jw5sEm9mcbAPNIg7DNpTa3EqcsTYpGHVoBZhsqe049NQmcwiBdI/7Bj8lu
	 jVkTnetHjIewg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
Subject: Re: (subset) [PATCH v3 0/6] soc: samsung: exynos-chipid: add gs101
 support
Message-Id: <176632516971.32657.9705305853301180066.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:52:49 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 20 Nov 2025 11:29:34 +0000, Tudor Ambarus wrote:
> Dependency
> ==========
> Typical dependency of the DT patch depending on the bindings patch,
> thus the bindings patch could go via the Samsung SoC tree with
> Srinivas's ack.
> 
> Description
> ===========
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
> 
> [...]

Applied, thanks!

[1/6] soc: samsung: exynos-chipid: use devm action to unregister soc device
      https://git.kernel.org/krzk/linux/c/1b3376d2167766e9f5ac05a03ca4625777090ce7
[2/6] soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      https://git.kernel.org/krzk/linux/c/8dfbb5fcb773a6481407ec890280cc3b1ff8e234

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

