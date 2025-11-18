Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312D2C11C6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 22:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506082; cv=none; b=u/4O+I/xGnEXeshlwLRGC/8YRjRTuUu1IpbYQXwzjEIuByrEdbFvEKiIkApxj0xF6JQDGoUQV0e5Xrm+10EVt8jIdi356Gnsiks1FBara81kVZrzeli7d9ctSks/xkhcq4N5oMGAaQx69fzslRt+7JmgjREIQIiOwqNm3p14LA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506082; c=relaxed/simple;
	bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rd86EbAc+XtP7g3xwTvNttMKGMloGpheDVRcCc3nurm1W5yLRYHZgcnPF8IjGEx4szh1HOB8V3rkYHIXSUIEU7JdSkHY4dRUQNg8khjUHHmxWaWGv/5UJLgLXVAQuRqZ7MJnKoYwpGxV7ir2IrMtxw9/A5isNtzlxBOKnwQF7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HUXDeXGC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HUXDeXGC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b75c7cb722aso202919266b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763506076; x=1764110876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=;
        b=HUXDeXGCBe61nW6XJz95uMOmz0SEuO73B//ihmXI7SsytbxNTBwyHoK9CzZLKCLPT4
         HJC+fzyGd5BKeFmuTu30VH1Z8SrOcdO7r2yVnXau5hxzeIF4tbvMKgmqv34c1idfFkce
         60wlvMTc1qGJl/LN5oDYqPdIVAhQbMYHMK2gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506076; x=1764110876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=;
        b=r7Qvcepuax3TLdfIpFkqrM1RIsVq3NBPlhTG7zcbasv2dxckRFINieu+zj09bUgovz
         X5IfHgTrF+n5pjyeyLQOf+g4qZNZpDn3pGEGwSQQIlnFrk+7nbTuQXtEG7bH4PABaegy
         8vFwA7F4ali+4tZ7A1i5iUP6NMPdZGMJJacoJf+Wsr/CJew1KTiX6HtMR3HUursndDU2
         uUJ3qyC7atdCwVMnhJzyuZf2jK4DnrWfb4smo3hZxE1DF+aJOzuyOlUagnl1QDY+1mVW
         yGhz8jZLmYjppTyyZHvqf39jdPCj9X14v8HbB/0OogI711UAoDklCLip0k/tGHpPjePa
         YHAg==
X-Forwarded-Encrypted: i=1; AJvYcCWxuKrBKt0F31RKnSDLCgjyiN8ZkYMR+svGIPOKPmkwh6MpO17hXERUIyfnZUbrCqjam9Qq3y/+a++yuqqrzDZJqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBXMZP9Uw/y1SvM+0081mFiyXFQNyamYWtL/zQ3etnU0hd0Wz
	WyHjXMRSuTdRSggfuZLygVvfP5akaSLEMmVMuE4ZEhc4wuOrbp9YpC1aqwWepH5T2rQy3iZCqxO
	SQLTznw==
X-Gm-Gg: ASbGncsu8WQ13JoSfcy7Yl3jQQ+2sgocO+XOZ75mbb3vtVB42URsreYIGO3M9eEW4dq
	gj6aPWoBLt1+GucgJNw0wL2LIU7Wn6Yx3N2cIznn1l2RHLE1a9JACo58VLHes85NUClzSnu66Z4
	+qb1rovzvul2N33KJLcP4ge8R1Z4XmKjZuLPkJqx2RCXNaDS62C1GrUe7bLV18iYslbdhdJHMSH
	Sf0ZGq19tVBiwSbK/jCf7gBY8vEGddLtPbrmWvFPhZCUlvrtnDHHci/PDAnOannSay256s+ESXG
	aNQe3FL4Ym4LBz3ImZs4m5RxpJK3aKXeaSDImp871Jf2SWfxLB/kZZMAmo4I6JbiwHIoZ5qws7Z
	/uKF+ooCEKT+fVl5+McGjxRkqKGl6KxxmQC+/mo7iVdKgkQK7yhEF+r6RWu/Q55dFWZ8Sr1J8To
	uLcjlYSk8HKIB+lDYGKNIwErDyCYPzNe2JUuIoH/P1DND9VzKICwKhIWF0qy+I
X-Google-Smtp-Source: AGHT+IGBmBVijf8XuDjlb7OSSS1uIqARcA3ATq5ffuSYFEsWJ3M1EHO1ce/aNFZtoTxjiXM/crN4Fg==
X-Received: by 2002:a17:906:dc8c:b0:b73:b1ff:4db1 with SMTP id a640c23a62f3a-b73b1ff5009mr685546366b.29.1763506075955;
        Tue, 18 Nov 2025 14:47:55 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1477069066b.6.2025.11.18.14.47.54
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 14:47:54 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso40771805e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:47:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl9yAuqaHluM3hTWbyJ+iwLqqwoWcH0QXKELL0rBS+wT2q0w4PkQKibv7VI7F0kmiU8qz63lsuBF9fIdSjdmdQlw==@vger.kernel.org
X-Received: by 2002:a05:6000:2210:b0:42b:2e65:655f with SMTP id
 ffacd0b85a97d-42b593499c8mr17946628f8f.19.1763506073874; Tue, 18 Nov 2025
 14:47:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <20251113022719.GA2281498-robh@kernel.org> <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
 <20251114152005.GA893333-robh@kernel.org> <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
In-Reply-To: <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 14:47:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ULAvZ3CkSta7bA5ANhen83RJZ2=qczvPM-gC-_eqTfeg@mail.gmail.com>
X-Gm-Features: AWmQ_bl_hw6vDHu8MkUl7OQYNBNjD1FAMZQn03A25BwsYvwyfHESZ3LQca8v3-E
Message-ID: <CAD=FV=ULAvZ3CkSta7bA5ANhen83RJZ2=qczvPM-gC-_eqTfeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 14, 2025 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> > I think it would help if you described what you want to do more
> > generically rather than mixed in with "add a new SoC" and send that to
> > devicetree-spec and perhaps boot-architecture lists. Present the
> > problem, not just the solution.
>
> Sure, though I think the problem has been discussed at length in a
> number of situations before (mailing lists, conferences, etc). Each
> time it seems like it ends up being too complicated and folks hit dead
> ends and stop trying to upstream. Downstream just keeps doing their
> own downstream things because there are tons of people all hitting the
> same problem and there's no upstream solution.
>
> IMO we need to start moving into the realm of solutions. I understand
> that upstream doesn't want to accept some poorly-thought-out scheme
> that will cause long-term grief, but at some point it feels like we
> need to accept something that's "not too bad" so that we can at least
> iterate from there.
>
> After re-reading all the above, it feels like we're not that far from
> a solution, though perhaps you'll read it all and say that you hate it
> and that we're not as close as I thought. ;-)

I've taken your advice and posted to the devicetree-spec and
boot-architecture lists. To connect anyone that was following this
conversation, see:

https://lore.kernel.org/r/CAD=3DFV=3DUx7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnF=
S7zoJA@mail.gmail.com

I've done my best to include all the concerns / points that were
brought up in this thread.

-Doug
