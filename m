Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64481DE3DC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737030301; cv=none; b=Am7mrrx/pBI0WI8vtvPyib/FoUVV09Z8LNI589bAwb7OXw44oZiDR+pnQxknqjxoF3k8dfrkUvnThnvpOzP4dagA2IlG7AHF3AcLop3dDkEppdJLdiEcHbAMDevymPtGWrSWLJpuLA75N2WNHXixMMahoQXOLFLNb83w7kAheak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737030301; c=relaxed/simple;
	bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYz3kzWLC7rihWXtgU1flS5v292ivcL6fJgFgNRdPxDUlFBa9iVz6SMYI/qLs0vqnCLPnti4Vkb0+gTYdJ4ycebvAto0x9JcQrZXaYqQz5WzT+3RUoJ1htfM042He1hR1OmkVaD3kT/nU2x4Op2PwHWHJcUM+DnvGjLlNpGuUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=CFNWmXdn; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="CFNWmXdn"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd0d09215aso8147746d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1737030298; x=1737635098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=CFNWmXdnC+15zhv1ls2VMtAtpSgohYCwADuO2mJvjl1BEsEX227eEFcUKJdvqiRShN
         74HGg1L3I2JmQiEc6Zu4C87e18yUXpY9efN+ddLBHyiOaehx2SEYRPsk5K1OCxAjxcUG
         TuUYYbgCpYZSSjxLHnKEoXXxqt3enit8uHA/q+XueTyTxF9xvvGZvtwaYx9ne0+6Q8Bs
         ZyrY54cyh+CLrYKrp8OFHNqj6JbW3uX3C5Sd9uS2BmW6Ra6w/DlyJM6SfaQT0M849wwN
         DVSom1HAdDSi/uhrIHpBTU2ZAmhPGezEFBSlyIcZlfQi/NKZ0pV+8g9YpRbcgZe0RLPd
         wsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737030298; x=1737635098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=NO/1PpfgqIUq/yQ/1fp8o59EZbva1pfMYTZv5ou1wxLx8ooAMfAol4pDtn5KhHgeXZ
         vE9DQCWBs2IsYVOqPqAK19jBT+X/Kfv5EUCBEcfLHrR3eOKLCFOM0Zbkug6VIDqTv3s3
         h73og9g82+izAomkjpFgQhtRURDpnj4bNuZCq7LY3YE5GRfadeer1wYCzT8PhTM0YtTn
         ZJ1r0CK4tfZe/sC97E26vWvRF86XfJR2ei6PtyiYkTXI/VqmD6lcBOnvXMUWGKbmnpXJ
         p4b028EIMlDoc4gUNQT4gurbc7F88ma9sfQXh+FYTqPObZe1J6xw/vL6W3BRLCrEktbx
         zsoA==
X-Forwarded-Encrypted: i=1; AJvYcCX5D4N8puxanJcKSyfMeOfAfMl63OJl6l57ymxZLMja1mSKmDdHHJrFkYwrmCTy83T2MxMIhfk5JEHK1/DdmCI3Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXIC1+pObEBVv9olg/qWvpTZgsRyBcoLy1nL73akuvDV1gV9+
	JqTenteFQ2qHpJ1DW7fAtHlFV0Yx+m9/pqmg2CPtF9shENsh0272YzTvbOwQ5+5OVbvmb089dKg
	1+Ch609y3ClU+T3JqbZ4/0iDwF7uMzugR2MmftQ==
X-Gm-Gg: ASbGncunp/B5TJClVOeG4bO9nfRdFZxwwlbLPTliULCNkbdwhUTUJ+Qb8y563EeO5Rd
	TWOE9ru+FEBLCObKvaAYbMXiXV7jsFmMr92M=
X-Google-Smtp-Source: AGHT+IHYPoThOqCGG0mIrocl9o1givl0D/RoYwWOKY0kUiZ64KPF9cSvP+6N1Rd6ke2PYtdS9xOibflODkJbaGvT990=
X-Received: by 2002:a05:6214:528e:b0:6d9:3016:d0e7 with SMTP id
 6a1803df08f44-6df9b2b1a21mr442378366d6.29.1737030298608; Thu, 16 Jan 2025
 04:24:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de> <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de> <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de> <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de> <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com> <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
In-Reply-To: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 16 Jan 2025 12:24:47 +0000
X-Gm-Features: AbW1kvarRJv1VyJjUo1t8ScK0brJ2o4-Qq6ABYK10edUo6rgOW2PAccCb4uQWlM
Message-ID: <CAPj87rNS7quwfqDmxyrW8_vQ6tnrcfWUn=81aTduDXtmdVkkAg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2025 at 10:35, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > On the platforms I have been using (omap, tidss, xilinx, rcar) the du=
mb
> > > buffers are the only buffers you can get from the DRM driver. The dum=
b
> > > buffers have been used to allocate linear and multiplanar YUV buffers
> > > for a very long time on those platforms.
> > >
> > > I tried to look around, but I did not find any mentions that CREATE_D=
UMB
> > > should only be used for RGB buffers. Is anyone outside the core
> > > developers even aware of it?
> > >
> > > If we don't use dumb buffers there, where do we get the buffers? Mayb=
e
> > > from a v4l2 device or from a gpu device, but often you don't have tho=
se.
> > > DMA_HEAP is there, of course.
> >
> > Why can't there be a variant that takes a proper fourcc format instead =
of
> > an imprecise bpp value?
>
> Backwards compatibility. We can add an IOCTL for YUV / etc. But
> userspace must be able to continue allocating YUV buffers through
> CREATE_DUMB.

Right. If allocating YUYV dumb buffers works on AM68 today, then we
need to keep that working. But it doesn't mean we should go out of our
way to make CREATE_DUMB work for every YUV format on every device.

Currently, drivers are free to implement their own ioctls for anything
specific they have. But like Laurent said, standardising on heaps and
how to communicate requirements to userspace wrt heap selection / size
/ alignment / etc is imo a better path forward for something generic.

Cheers,
Daniel
