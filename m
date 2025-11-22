Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF12773F;
	Sat, 22 Nov 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763816384; cv=none; b=ATafV6ICd3TRZJiJpU9CuMUtUH/DHz7MHYgiDsuZKrdMuAzOznkLvVGU0M/X6q6XRQ8XxEUa57q7/dJBTRtioQb42SSDMg0PhpP+jf2QZS6ok3WrqAv6g6qBCF/pcxzWUbWmJj691+hoXO8+gSdmNcB46nc+IQ1u2HFZZ8NWj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763816384; c=relaxed/simple;
	bh=hz/hyG3+eaA7+AWH/F7CrtmX/ec8gFR5mri57a2wfXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1E2HeToI5qdEmLIhjHYvcSRD3bHxoGJD+KBPfNN0/OaCF54mBKw5zygXOn4FqL35BwuOBrJGCAL8KbinRWcaY9VaX5HWc0BatxrUljE+NA7lH65mv7lh9Eqzey3TzY+YQVEIkjvdxaxPg3iWCArpN/yR7nMkhlgrOJckLmsLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1XdEiebH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1XdEiebH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E029C4CEF5;
	Sat, 22 Nov 2025 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763816384;
	bh=hz/hyG3+eaA7+AWH/F7CrtmX/ec8gFR5mri57a2wfXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1XdEiebHD6r5GI3cr7CE97VCbLYvOlEah1y1F/htZgjFkhSUHfYWVGNg+CExOb4Wv
	 VLbf5A9LYd7Hz0BT3vCSuPUsujQSieKHb95OPMT8mBwVM0dt1bC7rph9ORMSNVajFG
	 8ffYDYMm3fneHFkNb+I3kJeqTdiG6DRRUUGPcDIY=
Date: Sat, 22 Nov 2025 13:58:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] Add Google Tensor SoC USB controller support
Message-ID: <2025112258-italicize-exile-37f7@gregkh>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-controller-v8-0-e7562e0df658@google.com>

On Sat, Nov 22, 2025 at 09:32:04AM +0000, Roy Luo wrote:
> This series introduces USB controller support for the Google Tensor G5
> SoC (codename: Laguna), a new generation of Google silicon first
> launched with Pixel 10 devices.
> 
> The Tensor G5 represents a significant architectural overhaul compared
> to previous Tensor generations (e.g., gs101), which were based on Samsung
> Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
> components, the custom top-level integration introduces a completely new
> design for clock, reset scheme, register interfaces and programming
> sequence, necessitating new drivers and device tree bindings.
> 
> The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
> DRD-Single Port controller with hibernation support, and a custom PHY
> block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
> support is sent as a separate patch series.
> 
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> Changes in v8:
> - Add COMPILE_TEST to dependencies for build coverage.

Nope, that didn't work :(

