Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44749E5E8
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611393; cv=none; b=JrpAuTCLQxY+6BqvdVrJdXrP5XlO0l+q/0N588u0cCNDBnPpiSMHY9/7Z1zIZx47Za1Ao2FMqFKT1fptmqmoNa7PkigdCZdVFGWfXkwxlaerg7vpaHGjoRKI0FrieUgXmvVFMCr4/Nc1FZOxlCngqf/xRJ89T1GPV9in+buKK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611393; c=relaxed/simple;
	bh=hMg7RJefHBNDjWx7qlSUPFnIqApIedOx+ccA1coGGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onGgqVKKnZ26AcaO3eBeN3/WYW39xZ0Nb0ko72eVBrYcR5+m7CBuJtky1Wydv+UQMYJdLcW57oi/ZF06YuntIOulBeFNfULRYEbjdyXyFZn55EoTanHILXooNFpfIa4xio5f5ZuIw8+EZ3BSxZPJzC18J4a3z0LvAml0dF2iquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUIYRGfZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUIYRGfZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so26060245e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611389; x=1789216189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=lUIYRGfZzMxbh71ntNcHdfaX7qcD4W21aZLxy5KXsV9jI0WlTJMjwPTfoYUixE1+ax
         8VMCo0qv0LwmCspW/ZecFnFlkVR/KWFcMLPa2gNvG5MNCnXFfHJGsX+HiBRcZJ2ULwdo
         RvT44Vy9q5hmqgqqogM2Cc/pWIFt34PI1TYu6UM1fZZKQdezEwJ0jtWE3CE3gK1KDF8S
         3s9Z4ISt+ScI0rYlwygCxRJXM0UkOQIvcunGyvlinYZKEdEPhUHdzXkfTsnhGqdCHcCY
         2XMYd2un7S7NmKo52rrnRaQq+5CXgSSsvwGK0AMrnk/flDzw/NIk2/cvhhGqIXR9IfgN
         SBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611389; x=1789216189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=bA8onRCLWt4BFC5VY8dna8xet57GVsxoZzK89yRMDLA4KB7y/bD2ON5g1g+6Hr3VdB
         mZb2FYUCuwysuOZr8xjEvpGT0clzea3eLLrFjq8A6x8xNiit1iKmu50U9wkkyZxiH2nh
         QhmAPCErfL2/0WgP2PVEQzhybPv9iVUWOeV7/qhWgTsKmIAemgysHhsoFEVhqCIgx3bO
         SAn9K4RJIr9uPe0m5JcS02WR+9nVLAz6AjsAm9Ua6LawssPGeaFmhqd5TCsVmAzfPnZe
         CyewyYthUyCta/+wBwRIp/RO4bbfNO8bht/Cs+qt2299aSuUNmz/TQnLHWJmYDDeEP4q
         z+TQ==
X-Forwarded-Encrypted: i=1; AKwUvByT2YZRLxducyPo2nloLbuv6bAoIZJurE9mMjXWiddCa8O5LxEB9/mpfZSLQ0ybnedKXXB3/vftZpFsiq+X8KPBig==@vger.kernel.org
X-Gm-Message-State: AFuF++nuTDSDqXARHPBpIjzhut2p4k/Ta/O5zD+Q/Dylyd4SdhtaoB+h
	guSQBarPknaHvMSkQ+yjxbbpz4Y5nzFvLTDcv9bc8o+YF2siHIEhFAfj
X-Gm-Gg: AYBFou3vrzps9OHVOoH65xUJMK1MvDcHtOx6wenE/tQvh2dO0H8kaNEQifB9MrtqAX+
	MYU6hNqYLBPxrQJ+bILYyY7X0RMtPonQ9YCuj0JUBghVLFRpFKm5dK4NyeFJ0r0eWJoe3mDRCSX
	u/S+5Lr9Cj+jVDhT0Eiratvy935MiUFuBjng9W6BNz0v6x9SkPMel8NZlEd2kJ76dQR/AM9BT6r
	Uy6AG0/MrnXvDdt7CqIiSJYMgY4SvZmjQLaSri0EGH6FC7Zb+QuSi1rAoWZK/LlLd5vrSRkEf1e
	4bqKcpmQ7MA0XsJ5sFLVvanNcSR4T5ckrv15JRXfIR5kE4JM363Tiov6YJrAWWC3nWB9eSlwC91
	vOVYHTGjE7nz6zTMfmAvyWLjONAWs9ZpvpnBRugTPLtaNnvkVZVxf6ELYTlLUvM1eYyNel5SGKj
	TlGt9tRWwqng+7po9jkA4X2+hAti5kko5rHcfFn+KVKeb7OR3TNY5NEGNFUQ1Vi1FzyADQNFSdu
	bJCQUAJyjj4lIoSP6sNO8Haz+ENofpybtuNjHyuzBsWz0UETNxgLfrHRJgYuQHOmR9nZKcj1JpW
	U4ZSOI6sBfWrvmwu1y7c9I6FlOc70lzPmi7BD9O36C0Rs2roxBDmGZCYOLu2Ej0P
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr116977535e9.7.1788611388275;
        Sat, 05 Sep 2026 05:29:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm118555475e9.11.2026.09.05.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:29:47 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:29:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi
 and pata_legacy.winbond entries
Message-ID: <apwKitEmOv3ZwLkd@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-10-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905094649.41996-10-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 11:46:49AM +0100, Karl Mehltretter wrote:
> pata_legacy no longer has the qdi and winbond module parameters:
> commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> both together with the VLB controller support. The entries also refer
> to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
> not exist either.
> 
> Drop both entries.
> 
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>

This one is actually a duplicate, I just found out. Ethan posted a more
complete patch in June that removes all six pata_legacy entries which
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") left
behind, this patch covers only two of them:

  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/

It has a Reviewed-by tag from Randy, but does not seem to
have been picked up yet. 

So I suggest: drop 9/9 and take Ethan's patch instead.
The other patches of this series are not affected.

Thanks,
Karl
