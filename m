Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A734A79E;
	Wed, 17 Dec 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977871; cv=none; b=ZLySV/3JXM2ju4iw6+VK0CHxZW+PvzFUetqHcet7wQRjdhmP6ZBlmsrJnoFTPkWJdjOFU0m3kS22piIrcqMHBFOwBG50CvQmZhsnjb98bOVVV+1gDw+CYDq5O+By9q7Btdz67VGmVbjTMGACFjABHdLbUEj4rKfokipnAqE6hWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977871; c=relaxed/simple;
	bh=S4mO0XF+32E7SFhkQwowz/nXG8YSqhpXqW4U5Y8ZoMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2tgiqPwCSGj13YQuIC6XfbtCpdIszFZKu7whd4BD3IqqG+o0mGCW7pzVOO8XpIrctZmRAiDfr6ABiRJgmLU8rnNio9ouD6KCEUcrZo9dRoi7Otr8ULvyBs97nl4arKl0W+aI0n8/45tQNjtIrSJt0eoqMEnayja+UAmIElK2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nbny4sEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nbny4sEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F5AC4CEF5;
	Wed, 17 Dec 2025 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765977870;
	bh=S4mO0XF+32E7SFhkQwowz/nXG8YSqhpXqW4U5Y8ZoMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbny4sEAa3vtjAV51VCdRhWNa3o885gFfxTIyISmrDt3HSxaTS3uTncYjewmC2+SJ
	 FoiodPOp8/dKAZn/a4e5o7la/5iqh4pYt5+7+hl3i2nAPSjysY/eF9WqnI8vOilh4e
	 BKiZFGXmZl4A/J36w6g2xZo2FwivWFSzXC/4Qdoc=
Date: Wed, 17 Dec 2025 14:24:27 +0100
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
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025121728-reliably-crabgrass-2601@gregkh>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
 <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>

On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> On Thu, Dec 4, 2025 at 10:05 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > +config USB_DWC3_GOOGLE
> > > +     tristate "Google Platform"
> > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> >
> > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > work?  Shouldn't tools that check for "invalid config options" trigger
> > on this?
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> The menuconfig looks like the following and it doesn't complain:
> | Symbol: ARCH_GOOGLE [=ARCH_GOOGLE]
> | Type  : unknown
> |
> | Symbol: PHY_GOOGLE_USB [=y]
> | Type  : tristate
> | Defined at drivers/phy/Kconfig:104
> |     Prompt: Google Tensor SoC USB PHY driver
> |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=y]
> 
> According to Kconfig documentation [1], the unknown symbol
> would simply be evaluated as an "n", which is what we want.
> "Convert the symbol into an expression. Boolean and tristate
> symbols are simply converted into the respective expression
> values. All other symbol types result in ‘n’."
> 
> In a different Kconfig documentation, an environment variable
> "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> undefined symbols in the "config input", but I can't find one that
> catches undefined symbols in the Kconfig tree itself.
> 
> That is, the tool seems to allow this.
> However, if this turns out to be a major problem. I think we
> can either:
> - Remove ARCH_GOOGLE and leave COMPILE_TEST as
>   the only dependency. Then add ARCH_GOOGLE back
>   later once it's in the tree.

Please do this.  I do not want to take patches that purposfully add
dependencies on config options that might, or might not, appear in the
future.  Please just remove all of the dependancies for now, as they are
not needed, right?

thanks,

greg k-h
