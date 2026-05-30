Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088133FE15;
	Sat, 30 May 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159897; cv=none; b=lKOV+RAk1BTG3S5N20mJPebl1A3vAmIpi0i0RaIFHvxTG3bL8ZVwfOJJKu80AHypOwo1SPQsAneY2zMTTZtGkuVI9XT6nsKOIMqxTI/dMvJ77I7fwFUtryaHuhTgdDjM+QtrX4CgTPhYIDo6GidSgvXqgt3XWFmZ+4QVLnci4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159897; c=relaxed/simple;
	bh=sP0+xUeystX/lhZme5/NrNi0NW7w64KGCqkUVIDEHTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c81UHiB+26MH9kyqXu+TaMpwQ5sKRAFsMSfFnQSNkjme7WA3wZurwK0OFHiyaQtJNkE0WKKG4k0WCegMSQHni4O+Qjf7w/3jUsVdXyz4p+QlqEKbfyMO481tk9otTS1voJaedDuVPckm7HEZ2AhEEDgl0tIdH4rOMg8jJTjIzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAyAqQi3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAyAqQi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A581F00893;
	Sat, 30 May 2026 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159896;
	bh=Fs37mZtBEj4mh4HBBrOzVn2o9vM5ahogZ/D+zH8VWRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BAyAqQi3WXNfTP7owhvvOIsi35V9WV2a9Kf7BDnajl5xDaDfayuQiYxICAjvXvhcB
	 G9Jp4kdq7Q19B/bLt8FZK18fVyO1Dv05jr4VrOuh/KBzhRc7ZjkVdlajtVbIf3k8+I
	 iBP9oGd7wLwPJA5EfIHhVggz/CGu8VLgzDeqpFFqMPVHxBOwHLdTTn5F7/GQmMvWsF
	 wK8D27QgMNFMMXzUh1bY1Kw6OdpGxZszex0aXG3dr87ipI8KdYXZLV6VPG0JbDdwxB
	 mjL9IC8kQ8neyppeKCQdsWCtBVU50s+2ZL5wd1mbS9a40K7Fj+jhESh8geP0D5cDDB
	 WCHSuzk1WYE3g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
References: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
Message-Id: <178015989447.40681.11936234439376141101.b4-ty@b4>
Date: Sat, 30 May 2026 18:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 28 May 2026 15:09:01 -0500, Denzeel Oliva wrote:
> Use nMUX() for USI and UART user muxes to allow reparenting between
> OSC and CMU IP output when changing rates, and use DIV_F() with
> CLK_SET_RATE_PARENT on their dividers and gates so rate requests
> propagate upward.
> 
> Consolidate identical USI parent arrays into shared
> mout_peric0_nonbususer_p and mout_peric1_nonbususer_p.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
      https://git.kernel.org/krzk/linux/c/e11560b050ce867bd7d3ccea138231db54e2250a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

