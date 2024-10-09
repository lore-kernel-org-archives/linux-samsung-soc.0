Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BB126C10;
	Wed,  9 Oct 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484281; cv=none; b=N940T1NzvTHlonJC+Hv4xm3lUuQtzE8EawLbK0mVYFP1wWd7ogRxct6JlbMS1CMl4LmLbCJPWIIqMhz0UQ99F4BL6KZ6YPAWNqmhG1x8m2CK6hH60DEEpatEhLNWDaveblOT7j5asSltc7UlfzeQOrqQy3JIj+M1cFefjNFHjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484281; c=relaxed/simple;
	bh=3nXj1ZEqboUIvzbye41WPqLuRJaTL9URDjlyvMQHLJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8HWx+IyhhUWDvCOb2+qSWphCXoiltUFquF350JYLi31uTPyPcc3X9TZL5a+oJhRgaYjm48rCozugVb7KUUM7yHe8ssTJktlgtFlBDp4O2KHEb2hHLWifRRYLYd6UIgs3tkND6XQJjs7rjnEip1AGOu+PU/rDeNsdRProUJILnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir4SLNAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir4SLNAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF63BC4CEC5;
	Wed,  9 Oct 2024 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484280;
	bh=3nXj1ZEqboUIvzbye41WPqLuRJaTL9URDjlyvMQHLJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ir4SLNAYMZu2A5QwPPH6RwPjybwLXscaasv0VTFTD7RkbwwCq4XgWVwjjyuVY5ZS5
	 IPOBIotpoWoxZlzf7tRaeNCJLDuQMOSWPTY9VTQ0IxX2fRAtjpZcqOaVxu7nJDOOLY
	 yDVocnt6uHtIOZrGLks10+9Hafw+Q/SPfzEW0ymY91IhI7JVSEgWT1WtJ0H8f31WKA
	 ntovYkSIXu7/dxQWVZfQ0PzdmPk4nWOytW97lcun+hL6gWmHyNsgFMCc0n7H0UpPvZ
	 +ai5bMxpxfS1l63qqmNSjuvOm0NhXjGFXQ663g5qtvqxLR98JgeCuwZ8EJQm3RKGBs
	 JQmSlm6uME+HQ==
Date: Wed, 9 Oct 2024 15:31:16 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] regulator: add s2dos05 regulator support
Message-ID: <20241009143116.GK276481@google.com>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
 <20241007-starqltechn_integration_upstream-v6-3-264309aa66de@gmail.com>
 <ZwP2jpgdESV1XJ5D@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwP2jpgdESV1XJ5D@finisterre.sirena.org.uk>

On Mon, 07 Oct 2024, Mark Brown wrote:

> On Mon, Oct 07, 2024 at 05:50:01PM +0300, Dzmitry Sankouski wrote:
> > S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> > panel/touchscreen.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

I think you can merge this.

-- 
Lee Jones [李琼斯]
