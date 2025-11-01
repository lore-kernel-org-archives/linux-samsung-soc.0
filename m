Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49E26ED5E;
	Sat,  1 Nov 2025 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761977435; cv=none; b=apH/o/noZ+vnmDvZ67pjzgM0hycNZYvjidz8XJ5Vzi0Gm/0snk9OCoG+EUtTpgizTZ531cG1cgD9SizcKvp8NdpSm3t+CvuFCsMBHXUovPlchvP4Uhh2Dbh+wOVS/+AEZJci4YK15SKF5zlCJTu8AG3FZbwIrHSzs7IceIpYcCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761977435; c=relaxed/simple;
	bh=j+Yfr5cijQdjT2ruVKtXGnYQcWJxGCeRrDvfu1qPzdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUrzcIS2napMuaaHMs22b4b+T1/dIemgnWW/UbFeWbFKGmVlQbGE3l/mQfmLWBSd/jVCn5S53H+PjScb/Rs7GgFRs9YEcSntiu6vvJ8Y9pWwE2vRIXWO5pQboBYtRyLLcCirgkB8KbgyXVeU43S/EGnbM49gcnDwlnrsfF2SyEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dNU64AAz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dNU64AAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE9DC4CEF1;
	Sat,  1 Nov 2025 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761977434;
	bh=j+Yfr5cijQdjT2ruVKtXGnYQcWJxGCeRrDvfu1qPzdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNU64AAzHqsFhm0VugFNVN5YzL5HHeuCzK8H1H/2yKASkNrk59jV6glQQT9H772P3
	 5P7sYd0dYCZNy2Crzpc7GjL0Ozv4XJk7Loh/9ZKT6mSTIn28XCkhDdi0nfiTlVKlMb
	 VEj3CKxcG0/8EfIQC9FHQMgYKvsDHmVqCdTUT6b8=
Date: Sat, 1 Nov 2025 07:10:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025110128-jailhouse-situated-22b1@gregkh>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
 <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>

On Fri, Oct 31, 2025 at 05:49:28PM -0700, Roy Luo wrote:
> > > +         dr_role != DWC3_GCTL_PRTCAP_HOST) {
> > > +             dev_warn(google->dev, "spurious pme irq %d, hibernation %d, dr_role %u\n",
> > > +                      irq, google->is_hibernation, dr_role);
> >
> > Should we limit this print and do we need this to be dev_warn? It may be
> > noisy wouldn't it.
> 
> Ack, will make it WARN_ONCE in the next version.

So you really want to panic your system if this happens (remember, the
HUGE majority of Linux systems run with panic-on-warn enabled)?

Please do not, handle the issue, dump a message to the log if you really
need to, and move on, don't crash.

thanks,

greg k-h
