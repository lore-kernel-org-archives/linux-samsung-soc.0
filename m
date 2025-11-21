Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C52580F2;
	Fri, 21 Nov 2025 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737472; cv=none; b=TENhv/nAiRlLJun94hnj4TclBlSErOTYYySPWgg5w628liUlBRyzbKqLI6UZeGhWqPjMbV6mQYnOWD0amDu7abBwiyXp2I06iFwu+gP1cJW2MBuDsT7SOFdBdziDZ2wzVLBZdEw4h5bPW2+da9EgHBad317jHJ2v9eFSWyuCh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737472; c=relaxed/simple;
	bh=qTJhN/mreeF4Rz/xNaw46dJXoclaETBmadBNsuSiMZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub1z1WdI1GjLCC/93u+2fWuTGX/CyGA04OONYgTENsG4ksuXL2CNFrIPcg6CRjDiyqaH9XZOqW38exvdxzd1HTG84igZ9aHpl+cc5MTdYqS2qfQYpOeblmj1+NPZ4Vkq97QxVfcmgB13OwmcEm9MfKCS2Nnf3g9si1pmdWC7S8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=obfBwo5j; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="obfBwo5j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ILc8yh6YOOoFIzJ+tZjqghixKaKMpYM5qDbQunnGNNk=; b=obfBwo5jzkTt9G6By8vNaSFZFt
	P1PSmSQ8oCgFqETqveCGTfTauQH5saDlc4OQ7uVnNzt37lIcoeEmtdt2ugTpxmyEeeuDpxB2kXrlu
	fu04ZLnQDLjI6G7YaxRalG3ki8i4Lwa3PkmuTPDKXBsiplhizK9AfznXhD6yWPAkKx9boNjPtA316
	G078MyRz+NyuifMwChhHGqSXwLpJsgRS/wD9In3uXrFVAQMQYHFAxYakdD45wSMxQLokGcLmBhbCw
	DJMdwelE+5ikf9Niru6qA5oHtzWX55y/YXb3tkPJyNa+lTb1X0jxfNQxH+zns36FziZJZrr5LJpMp
	iIgnqCmQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35276)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMSgL-000000007hO-1G93;
	Fri, 21 Nov 2025 15:04:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMSgI-000000005Qn-0VDD;
	Fri, 21 Nov 2025 15:04:14 +0000
Date: Fri, 21 Nov 2025 15:04:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
Message-ID: <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120184242.1625820-2-willmcvicker@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 20, 2025 at 06:42:29PM +0000, Will McVicker wrote:
> The function register_current_timer_delay() is called from the
> exynos_mct clocksource driver at probe time. In the event that the
> exynos_mct driver is probed deferred or the platform manually unbinds
> and rebinds the driver we need this function available. So drop the
> __init tag.

First question. Why.

Second, have you analysed the code to check that you _can_ call this
after init time?

Let's look at the code:

        if (!delay_calibrated && (!delay_res || (res < delay_res))) {
        } else {
                pr_info("Ignoring duplicate/late registration of read_current_ti
mer delay\n");
        }

So, if delay_calibrated is set, then this will fail. When is that set?
It's set by calibrate_delay_is_known() and calibration_delay_done().
When are these called? Basically after calibrate_delay() has finished.
When is calibrate_delay() called? It's called by start_kernel(), while
the init sections are still present.

So, calling this _after_ the init sections has been freed will result
in the above pr_info() printed and this function doing *nothing*.
So it's utterly pointless to call if the init sections have been freed.

Please find a different solution.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
