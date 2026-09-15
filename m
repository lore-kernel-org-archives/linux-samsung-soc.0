Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2D4418F0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500653; cv=pass; b=BIbL/Imppffwa6Tm4wOkB0nCOmCpp5yoIL6L5kY/Ybnw17igmDqVgR2jgNSMjSsspkzC29lbbYf7SYkRF//gI0OnYNOFxnz2FU/aKUFnMX6C8xl256zsHqEqgqya5k9EFyqMYTQzD8vrEE7UcRzGOm+1m2Kf6Xt/7IEMEbQ1q08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500653; c=relaxed/simple;
	bh=RfxsKW+gWzHzPnl0VGV4sp1JrOew5XduTAso8G35GXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PO6XK3Z2rpMA1H6rvEu882ZnM88avKun2Una91Gj2dirs3UfLwW/FawkJRXqtfGyNLowBJSUuiZ+SjBW6Q2Akf26t4Tf9Xymn72tsJv7Flk4daBA+UXyWqxOz+LaoTUVFTx/bQs1PJbK5WnBKZx1dwv6sTEDXl70S4SxlqohGBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mHQpOIQY; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mHQpOIQY"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so50709e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 12:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500649; cv=none;
        d=google.com; s=arc-20260327;
        b=dOnJYft5LI/0bSxV1dHqtO1NzkVIKWOKCdQHt+2w2fXHd+0rA8txboqs549txp2ANK
         sxutz5CsuHGuRnRkK8ajIkhYv4ntidrQv/XSKHINGdymerHNkA5CA2NIgcpknf3zxx41
         KGw9gPDvDDHaYwIsxnlMGOuyxBxPQi47U59Mk+stb0n9Slm2TGkNYUHROMwmpk72+Imo
         eE0svsw86uAgFGtm117Cz3xj3hgrWPRMGBaksD+dA5gvL0/tBpZKChv9uT97ZW0/xUrc
         zq52r0bXcyclhzm3+eBMWG/GSOhHL2zLfGSY5DORZgxy/pWAUlI3BSgIn9ffnSXSxv+S
         ijTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        fh=rEIZLTmjjdiaijv8RHSW56LWZM/U4VEqCmRAEWir4jU=;
        b=CoEYz6EwbuomzvxmIbM06zgpxLKli13Pvt77+YS6Jhd97IVxn26Y+Lyz3PZtLttIkC
         YpDQFjMmHDA+iWDL9ZGM0ttoltZm99YXGQfLr6qOKpzEjRU8r1eVu+71FwUrPjv5AST5
         xI0c7xJnxme5D11cV+oDJDLb5j9o00Ue5JL7xRU6VBMuV7vMV7gI2+kgcxSQ0Ie6lB54
         SYU903EXCpcJpUYS6DL+5eUiPyH31f19n08CoH1oS4mEOBafxsRVbcRk8gHQaKIfa7Kh
         K8AbvgZmV72DN6CHVRPjUqzcwxiSSGS/O93d9o41iqLlLo80XASvhnbvQ3edXeuX6E5t
         3Jmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500649; x=1790105449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        b=mHQpOIQYcK/f3LO6suOWFn0Cy720wLrLpDZ76Y2mpOM3+C9DQTQajqMKss2+8vswyu
         6kP5JbXC/uQnmjFeNyvbn7ykDMjEjp2433FP2tusVe+U1jFmELny3ub1VOqaeQk4+bmw
         tGfgnCt0FH77KKNFK/CBvajJjeEiwDPenSWUOdNQWc6FxW5qw9OoucUz3vPurhja7+2W
         SRX2li+U/pB+n68jTLoULDYN4LWrOMyMYUPvz3nmRdNTo7uPdox+mGt4Z2VuXMis+C7M
         e3WQC4JCEtRXPwtZDWEutENmL8gBQ5snBkXOOLsO675Xs4UrytQv+QbVij8iLiq/Acss
         xb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500649; x=1790105449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        b=YGpRSYLy4Si8KhuUO2z9dpePzmS6xRMB5dSRnakmvQHjwO07uYrSduPbXPBU0Krs7K
         +TbtcXtmXNxQ+duFI1KEqxJyzDtILtxC5BupHBI+Da9uw6GKUm2WY8uMncYMp4o6gDSZ
         Xggh9OlrsKUjt0E15CvT6mGyaux7CiytNr6yYY8dxP0B57W4NY6NwLWms+UXgG36ZXsI
         rGxHZ1mjOmMEmVPBd8jxbHp444wT828fDPqAQbWKuHqUBgowaelkFSYbXyCStFOmCm50
         PiWLafSUL8Ce5WYmCoERyQBqrNXdL72BJA0aqh+bCrGQ38GhzO5QSuwahPh41uCBku96
         Soew==
X-Forwarded-Encrypted: i=1; AKwUvBxPQUTf0hLX2GFH72TWHSygXUZP7zjoFqF74yz0T/VTDE2gM8G7AO7OowHCmYYGe9HuyiNnBg6mbZHFZAl6WgiU+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nUo0zvcBaRxFt5bpJ9oZ5UOjx1EbZ81zUD1Ivu3imRjtq8OliC
	j0n2gnYp70Thuj/zbGtebRaVISYXu7al0A98HsZcAsnsckO0F7xn/Gqr0mWkfrC0gp61QvBysRI
	Lb80N7Ugbm8gmIwplpnJCRaRTPCx6yVVBk4QvV4E=
X-Gm-Gg: AYBFou3nSTilERc5+BVtlgzK1UMk4Cq9M5Z4eOVfncx4yP+8Gdkir1iAeBCqfxdBd3B
	g4AsbucmjE/vaETShywA6wTF+16737v3+99hVzth8FsXs4hpPcczCqvaGxnJrRIz/hrfT1CqoX+
	w4IppmPml6zoLgp+jR1ozAAsSMLVIQTvU/TxC9PlouMXCJpbOKYDUCZqEFEN5GdANXets01RcOl
	w7lC0PXglXJGgn9ZlC6uJfR9jy5rUsYE7HXsl6prJo+5pLAQ+EZHlctEUxo27xELf+Y6dHuly72
	LNR29XjNKMWBZJFQa1MviBdxG9EbbvSfPU7tOrp/1+90n+++TruB5iYtJzy6y2n/21I8xxLhGsL
	Y9dnfHOO2JgNtSNqsUdIAk3OC0vBd8aoaCpKPrEELlEk4DS2wFrQ/ugoQaNM4r3s=
X-Received: by 2002:a05:6122:8d4:b0:5c8:3697:9289 with SMTP id
 71dfb90a1353d-5c993b49b7cmr4231155e0c.8.1789500648289; Tue, 15 Sep 2026
 12:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-22-morbo@google.com>
 <202609151147.C5B45CB@keescook>
In-Reply-To: <202609151147.C5B45CB@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 15 Sep 2026 12:30:31 -0700
X-Gm-Features: AcwNN1W7vYosDgc2DMy2_OinBNj1qeEQ35WOY6PL8-NHlzjaHMOKmE1leyIGWNs
Message-ID: <CAGG=3QXYtmJqE5oy5ZD0-G0=GNxK71KKYurusNJvLQNqR-o6+A@mail.gmail.com>
Subject: Re: [PATCH 21/28] NFS: nfsroot: Refactor root_nfs_cat() to use snprintf()
To: Kees Cook <kees@kernel.org>
Cc: nikitash.mariiaw@gmail.com, linux-kernel@vger.kernel.org, 
	codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:52=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 08:18:38AM +0000, Bill Wendling wrote:
> >  fs/nfs/nfsroot.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> This collides with:
> https://lore.kernel.org/all/27956255dde39f58d73a7b51cb53cbe3d7804f54.1786=
411026.git.mariianikitash@google.com/
>
> > +     ret =3D snprintf(dest + len, destlen - len, "%s%s",
> > +                    (len && dest[len - 1] !=3D ',') ? "," : "", src);
>
> I prefer Mariia's version because this inline ternary is difficult
> to read.
>
Agreed. I was trying to not stomp on her work. Please ignore this patch.

-bw

> I was expecting to land hers soon if the NFS folks don't pipe up. It is
> one of the rare cases of still being open-coded, but the strlen() usage
> was pre-existing to check for the trailing comma, so it's not a clean
> seq_buf() conversion candidate...
>
> --
> Kees Cook
