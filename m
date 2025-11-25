Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323423817D;
	Tue, 25 Nov 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078667; cv=none; b=ruOoODBFnDLqRB+ilv3XmI7t5L0w1tWM51Gd5+64b/QLWdcPOXBZqr/wkHCJO+UYrPwIgt1jO//oLIJFDSfrghNwWx3qQhz4dylcOAaKJ2yL222V2OqwZvrRDbhh4zLJEI3+80WTR89dn8wUwY2K/Z/woV0myd5vSn56w4Zmu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078667; c=relaxed/simple;
	bh=sibNeaYqF9tnV+8sAAGb7YfLYyiqN4FsfZ6/ZvBzW8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uv/OFfJDAHJpunxZJIPHFsUMTcAIsTU44xl+ptvNM1h2gw1AvQ9h7lduQ8jCe7LgflFAFnNfToklBC+rzfScI/qqWXxKAyiKIX9B8w6ilCXoA4nbTqRgAcI9pZy7YsbTl0jfwUCvsBO2t5ittK9eAj4ZNc4feJLxjjJjPF6qrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8Pk+4+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8Pk+4+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9688AC4CEF1;
	Tue, 25 Nov 2025 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078664;
	bh=sibNeaYqF9tnV+8sAAGb7YfLYyiqN4FsfZ6/ZvBzW8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B8Pk+4+7vO8d+I1LkSrcA/oZAta/YbNncZJk1dsqqzBH4zpW1QPqyJfdWp32ngP1i
	 c821Q0G2SxBvAA8w2EirGOD6G8XKPHZuT4B4H/Z6dw1zMNMscSCDzbz6UGz5BkMK9c
	 vY842msD7SmP1uFqsqexvVkRZ5iRFVC7hWOQJJjxBqEL6bLZDGbmOmvb7p+7Kf9wxk
	 czz9w1FMpWUfRQrTzX2niaATLQNm3TZVvprPlIoi/wwZBZVXlP08UkgDcAmae7mtJ0
	 xKtS2uzqrGPjpEejn76S3sEodH2CvffIzZML4pZblWKjVvl0oVH+iiMP7C+sGjYV4l
	 kfJnoiR0xwL3Q==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251124-s2mpg10-chained-irq-semicolon-v1-1-578ba2d7adca@linaro.org>
References: <20251124-s2mpg10-chained-irq-semicolon-v1-1-578ba2d7adca@linaro.org>
Subject: Re: (subset) [PATCH] mfd: sec: Drop a stray semicolon
Message-Id: <176407866334.2689834.4726496562254292195.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 13:51:03 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 24 Nov 2025 06:47:18 +0000, André Draszik wrote:
> A stray and unneeded semicolon was added here by accident, just drop
> it.
> 
> 

Applied, thanks!

[1/1] mfd: sec: Drop a stray semicolon
      commit: 44c603f35cad3f3b0f58fece99502d81620da9b2

--
Lee Jones [李琼斯]

