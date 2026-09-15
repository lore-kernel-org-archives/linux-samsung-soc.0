Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601813D79E2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447550; cv=pass; b=fS6MpZY1vmvGth9Lld9+MqqK05NwvBRRIJq4jGstG/oM4c7ijqi7a095AdjHKggKhVo0eOwQxShG1AuqD5n0bpJpVkwU46QUeIebZMq8zi612UhbeiuuN405MhL9x19z1bXmSbiMjEm+M1HFszCoqBvEsECFBTUpllrgLveXol4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447550; c=relaxed/simple;
	bh=i8lUUtdcjqnzF0iI1zLV7fE+XgW1j6mCz00AP5bqSqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeLi18euezKEXd22YAgfTIU6aBiTfD64TY4rLaf5DvSRp2fEbH09DA0tllswt0LpX3uJWvBG07e+bcX2ENKf8pOgNggtuJf1CmCvXgrGOgSC8duaDZP++9ype9ipPLhizfjLvBD9RKqrd0UuUCmFpY2JsbPmZpaBluXMpDWCoV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbttgRWh; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbttgRWh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25b661d37dso574995766b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447544; cv=none;
        d=google.com; s=arc-20260327;
        b=D8ymSccNeHf80gwYJOoPtItJKlA34d/irzVttukNwjynnnV7MWVw6xx3YNf9PGW1JB
         u50U1i8Wer3c00XxkSHfqyKDfPqixVG8irLdBJA5RebCLLNlJRUtXYOfft72lvl27HKR
         nnuRtoQkD8G9blrHG51QOvoGuysXl3hlCTe5WVS2tQabYUxFd4gnXc/br1KOkKr5Betw
         /2E0ZwfMgJX2BHgc4u33VS9/OG0DmJzvotR1gT6y8pW81pMpXrvoBl1ih4Z2I6ka09Xn
         wgJYQHqbkEPxJfsoIk+wz174bm1cOLjpYNpXhyJSnwzTHWMqGStL+hcbDXOuHt4vQIMe
         2tMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        fh=NerlM0LBTvdyrFFXdLlfkl76/UJ/dOn+Q/SUxyZY7+4=;
        b=DxzzMuEsknkmbXIq321AQSGY9ZoJ1/kesXc5UsenH0PdSwm+XAX4Q6ahVpSYSmrYXp
         CMfLNVie5ZJArRhnNvoFduSprPgavR9DhIAZycm1AFBzA80LmOG2z+mTvImUbAnkioIo
         L2BM71TA/yTUUXp8nTNljFxXFJE4z5UtnzNJFiGg2x1y9DC0tCplVxxH9dKTCsHVYyOx
         6GFVYy5u1L8M2m6AD8oYIIEt26xh+/zjMlQExjRqBilwPwXFf36tmk6QZiyK1NkpiRSs
         f4vkPmPnSfF4CvcoNau341YPMREhK2togDPTOyuwJf56MKSV80sCBeFpNeG2hH+XvLj/
         5csg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447544; x=1790052344; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=CbttgRWhtvI0N9xtlUCmv54XHEUwLxuuRs2Gniep6j59kPcZbgPj71uyWJBSwDoS0D
         Gy6CsWaqN17iZjEA4ohTnNdpeBkpOe0jpOFgyWCsaOEpxL2prsMtygtFAzp2I6j2NYrj
         aImaRZeUykYMYUvTODe4Ae/lqRZPcixLB+7HtDuxY+dOmg7VH1WBbOD8Wd5IPcqOnJq7
         aoBvKyX9F9M8F87sn1Zu5F++ssDnk6+J5M59ojf3/w1BhCZmp4nuaYbzD33yZE4JnJ6Q
         fIo9IOtuS7V4Q5e7NW9kJJvtaQBIbD+3G3/bNU9X6zA4+kAVLQ8eS9OmcTUDPU0UJOUG
         cpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447544; x=1790052344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=vv8rM5YAiPykxVWg5t2wjYSD8Ww6Rw37ClHJGQd9/MSb2yFXJ/PeOZtGH9z+HTQedK
         V6Z8sGqG4U8B5cbHdzmNCZjeUWAfubuKEbvJ5LymafnPsSE8hyU9xz3AGUk+3RUvse0M
         VPREV3L4IWLv4ER1SKGTGsEDZUaZVJzsc+qWzlSPfZuVMqLva2zYAtaUOrRqYKcOPLHa
         Kr6JBUzj754nGAZG52WDnrNj6JOn+t6wQ1ULd8BvCEGDKm2yzuwiRrMuvjp3mL+n6yTr
         A2ZonvBb7QqpSuklI2mcKTZ6UsY9XL+wP+niopFwID2JPa9gtoBZcCFEnV3sxLVxXF7g
         HimQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlrlpYYX/tXNOUeYDNQwjrXZsqsZJlt+76lLM44H9MlDO2HkgxEvealRJ9bJd/g/yYaiAWe+tk83GCKvXbBO2+qA==@vger.kernel.org
X-Gm-Message-State: AFuF++mdiz8AvS/MyKxoQ0LhNyptQ8BBLB2Lx6vCBqO/mCycgqsqaeic
	eZRQo2T2bGI9VDq22TfnnqTlX3/VrOEmhLawLLVv8cW1KCpA/YiL2zs1DGc3Fj756nMpyrPsUSQ
	4a2z5Rn6w1MU7TFXzRl4i35PcJQ+jlo8=
X-Gm-Gg: AYBFou11gzRGMvhILARxVxqEQHE5yOBcRB8F6xiQ/rXQ1/jz9FgfrXmrpvAO3IkcD2B
	eI+GAj6WL3w3dSn4q/qewc8oQJ3S6PEfnvfLL+jBYCahZYahzZ/eQA4XQTok3Bx4t3SXfqddrZ1
	oMkqnoCFExockgyIdbgT6qv3HNmEDMgOt6GES2urw1WS35LhAIpQ2LCXvPLRw9HI3fCQDy9YkvN
	DcAmQra3FE9fyJ8bbirCLhkztSFLR+YDUvRZLiR+SpDrwjCcJI4rX5mt7FFf/LTVJvHTatz7U8Y
	pXDbF3ghDClPrLx12CFEiaNwf4C8WVZhf6FKRNzMcwoXiUZbBz+/dbQ=
X-Received: by 2002:a17:907:d8f:b0:c25:c54d:d1a2 with SMTP id
 a640c23a62f3a-c29b864787dmr350678466b.18.1789447543614; Mon, 14 Sep 2026
 21:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-10-linux.amoon@gmail.com>
 <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
In-Reply-To: <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:26 +0530
X-Gm-Features: AcwNN1XnROT-wl_Pv4SIRl9gq2osyQZq9QJ7pS3eOAiL7xJk3WzBKCm1k8F3Pac
Message-ID: <CANAwSgQ1Uno50rGMW3Mrtrmm_DW22fgOzbLZH7uHu=StQ8_t8g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
> > TMU driver provides thermal emulation support.
> >
> > This ensures the thermal emulation framework is enabled whenever the
> > Exynos TMU driver is built.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/thermal/samsung/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
> > index e1e8035d24fb..7d5590f78185 100644
> > --- a/drivers/thermal/samsung/Kconfig
> > +++ b/drivers/thermal/samsung/Kconfig
> > @@ -4,6 +4,7 @@ config EXYNOS_THERMAL
> >       depends on THERMAL_OF
> >       depends on HAS_IOMEM
> >       default ARCH_EXYNOS
> > +     select THERMAL_EMULATION
>
> No, drivers should not select user visible symbols and also this has
> absolutely nothing to do with Exynos.
>
> NAK
>
Many distros do not enable it, so I wanted this selected by default.
> Best regards,
> Krzysztof

Thanks
-Anand
