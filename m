Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E242533D6;
	Wed, 25 Mar 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459083; cv=none; b=bBnyGf2TqadF5/EhmUXqGqSzbCz125CxZjzUAzB1ZhklOis0KK7fr5vleKTtx3kiZXtXzO4k5os+MjLwmH7Lnc7x9RpQAvhXJjE6NGGA8qmu2hic9/ScKQqiTjX/Zvpp91nUFxXQIErC8teKnw3Cgzie9l5goW0oI4vi9qVFlsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459083; c=relaxed/simple;
	bh=cFS0jVgZrx7xu2C6f50P2frIPGlrT8eOzJuFuNpwFjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNcPBHjioujRooDBzD8IX0WkyYU8UfBwoYtzpEw3TLXMEwsbp0f8smVqfxKWJt1t+VxUgrMs1mkalyWHn4zGqMsk2zUvYhH8/vYH1+IAwJ54R8Q2BXSSAvpf/2BvDbrFDiybI3bQPri7F7GYkHtSFd48oXq8yq4ck1wBr0qiTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcX6HqEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcX6HqEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281C8C2BCB0;
	Wed, 25 Mar 2026 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774459082;
	bh=cFS0jVgZrx7xu2C6f50P2frIPGlrT8eOzJuFuNpwFjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcX6HqEa9DILb3F2zUR/6AhM0A/9PKp4cV3eA9+fWgQ8wT+lQxqy0PTE3FfiypTqH
	 kBadxVFjuUA6toZFjYMdCn53aBHhdTO597fzrhBxuOE6/rZeeF3a7Y2EKJYa/LoRR9
	 ohKbB4ztRSpm4likC02IDT8SHbff4ssAecKdQZZkWaWY1yaVsezERg+tOS0qh2A26u
	 7ExNBYswAZTmtZiZthye+wrBnmcKgAGkFK5mgc/AQE6BaaaVSb1wIqBm5xNjw5ciWl
	 PNWZBbkTPlFhL99q7kGVlsvVExGHf7KrsIUjvnYUNIYGQ12Z9U93LxPBckW0aJDnQb
	 22v+ZUU+bbFCQ==
Date: Wed, 25 Mar 2026 18:17:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	stable <stable@kernel.org>
Subject: Re: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before
 using it
Message-ID: <acQYnURilS0_fTvS@zenone.zhora.eu>
References: <2026022314-rely-scrubbed-4839@gregkh>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026022314-rely-scrubbed-4839@gregkh>

Hi Greg,

On Mon, Feb 23, 2026 at 06:05:15PM +0100, Greg Kroah-Hartman wrote:
> The first byte of an i2c SMBUS message is the size, and it should be
> verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
> before processing it.
> 
> This is the same logic that was added in commit a6e04f05ce0b ("i2c:
> tegra: check msg length in SMBUS block read") to the i2c tegra driver.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_2000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

merged to i2c/i2c-host.

Thanks,
Andi
