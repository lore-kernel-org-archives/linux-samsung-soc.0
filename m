Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3C34405C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938617; cv=pass; b=bg69FuVux2c72e2FvwrnKUhi3uJkbe6YR6dahZdAxR4p7c2yM51bWZGkxVTV++wnIYAJ9SA1hlemcmb9yPo5gDI+MB/2VzTht30vewU6IoYibs/F0hFgJLFoKp5AbysOWCmF3Ec6j94yQa+4LyX7O/k6cgN0tTrludy8/0lHn4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938617; c=relaxed/simple;
	bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuUy8JkfZl17ioX1J1bbFBzwuJMmU0PsQNaRQLub080BdzdbtS19rcojZ0/i777RTGF/TRbo9SNC0mVx7tLJi9GG5rOAcmGlcxB7cDglWyJK++AXOIMQbTd42M3tOACTGhG9JqbwCtKyqdp8O6czQGGfrvn86PDOB26gmrBAPO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gbGhuo/r; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gbGhuo/r"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bcda08c76so10251991fa.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773938609; cv=none;
        d=google.com; s=arc-20240605;
        b=b8bNI1R0S9gVQYwwoXaTxvX0ZQSYv3zt6VJ3ddoXSJx+0mfWAAivGQ+N2QLkrjlzZO
         95kKuMLTEncwtXUrRLrPoN4ZJ0mdRPc0DCvYfIivlI6DODRTxvhQyQExhzwlch0ybWBW
         4FAC82ZV0qVYGLnb2mCDsCzfzqEfamPDpXUIorQ+L6CVWx2ZvSIkPrpP72XrkaJPmBIz
         gosFi3aDT7M8K78nmAAAGPqSFDfoercBayMFTsnpQlNzliGfvv08zGhXGZH42H9LdEgo
         DBkrqblR8e1hb4odJg+fclApYRDd8FiAjQUpPUddT3dVrUCSGQorWDjkjgqkRqYe5l/Q
         5RXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        fh=J/UHa0UQZd8Ea7KbXrdiSgeQHjwL3USKa+1NHcmM61c=;
        b=k2sAawrE8TlrwfwiRWpAUuYcbbX9U6yHC5482mZZ7aSz+GHNdzjxQf7fVdFCWsZH1h
         pae5c6d80pmPAOzfq0f56TJGMLw5pFhCMZyK7qwYUuVlhKxCiye0gC7lm2Y+B36j8kR/
         +0IJ2AjIy5ne+XcC3+3GDBx2TJihnKp/SOds68jC4s1IoavBzN5Fa0C9IGFcQicZYAWq
         LKZNHYXCE5YCniNu/qQ3CXg4ERi8VoIg4zPQ7zFfIkqKltRNn5xNq+H52/DF46UQ5Iai
         m/9+bxANxSfpj3RstoiLO82Yzu4nuDaev69ttPKhw7626EE8+AB/5VOnAWvFon33oIal
         SI2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773938609; x=1774543409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        b=gbGhuo/rG1KM01mbmrI/+n1PIhq6yLZERMlC49+Hvy5VWBMsywIYe1BtX10hy6z3NN
         Wq7WOe5trpwgbz9VXuddO7NeUPzPLCKRqvlYHwRXlj2ypsQt1s7F/4l+uoVfHhs9la5S
         Y1bb4CQexfezFo5JZPV7ZJ8PE4PVUdw+vPyAj7YcQz7nvo8Am1XPpTyUfE6iUY2pCk1M
         HU/eH4nTrEPb3S2WVOyONRbuBE8iJsJnubWqzp64+/xrtra6Ih4tNuFaUE7vczLQZSKv
         zEuHALM0AbYRZ6mkwWYUNcpM0yeSegF2olmHzpb55wWbrwOaqo0XM/X7RFlbmOUIQQj6
         fKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938609; x=1774543409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        b=k+lMJ43K4lrLXGSe62/SOLfyIeP0izyR/v22zrDj8gMEesHMPD+LFr6ONnHSWI3XR0
         4Qj8V631xAx3GD3QLAAyVK/Xp2nEsVHM/5zZ57BiOS3jKUC7bDz8pXM8qjjEu23Ytu9E
         ipFNTtyv/dDzrIKcCVSAuux1ZPDuwVMQJ2lqwWACqx+YbTUeQ17xZBlxO7JMX7ZXtToj
         TuxqbVKAK3X7sd9jpTwKZO7DqihSGmgJF2j3YiDhQlOwSkehCHWauqiDVmcYoh6Xunq9
         lewcc5yOs1LSKGE7a6q7t+1uMUmjupC/vmzxzMxcf524G5Ot1NRuNGRftLinUgJwmT1I
         EIuA==
X-Forwarded-Encrypted: i=1; AJvYcCXOpaZ+r0+xLHWLRPZp3/3UimOlzdAM4DGYCpSV822N6vGiICqyp+v86eokhe7zc4KW2M5HiJgql4pIE/ajbY+dJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6Gw9qutyF0P67cQmpMZgEyUF0E3tXNFsc5NcIoW0pzy8a0UH
	HCyFqHyGjTMZUdcDAOimmHhTJk71ptpm9FSyrTuTvurWvUGEVUm4JL1Kpwlygd+HM5VQDv9jnNU
	Qbeekuk2OSM45W5LLX4WC5wrazWOLVZM4c6Gt0xh4vg==
X-Gm-Gg: ATEYQzyeIs1f6TtPPrMFQvSg/WO+KrLAbmb2ndtQDRIp6gu0235HK8aetjqLBUXcRqG
	NOdHeJMq6unYNMH3BW6O/WalzaoQO29iZiBB3U2LaZ66DEVjvSkliexG2L30K2ozqgDsnA5hCxr
	dZjwmU2UGLwlTWdMT3/NT3TooqEHbhJiis48t+LinEduUQ7cFlAldYAt9YXGcVQJATuNqSFhIkd
	ubt7N+doRIl0XNA4IKLrfD31l5XsOW99jV5Sx0XfYkyro/I6cjV+SFKqTTGsYdk0dRt47aUTimb
	oSK2loIp
X-Received: by 2002:a05:651c:324d:b0:38b:f0aa:36e7 with SMTP id
 38308e7fff4ca-38bf96ddf40mr439181fa.31.1773938608940; Thu, 19 Mar 2026
 09:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <20260318-gs101-pd-v8-5-241523460b10@linaro.org> <CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
 <CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
 <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com> <ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
 <4809918d-fdf1-48c0-bc10-fcf75837cb81@samsung.com>
In-Reply-To: <4809918d-fdf1-48c0-bc10-fcf75837cb81@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Mar 2026 17:42:52 +0100
X-Gm-Features: AaiRm53oqCm_eJUl4m-8pk5SCQoZ-_Pm5z0ieeorC9RntVzrStWwABAEThg9uu0
Message-ID: <CAPDyKFp8zsbgRA746Sds+1y4C0FvyohF7AFVsEghVkhukGZafg@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2026 at 16:57, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 19.03.2026 12:58, Andr=C3=A9 Draszik wrote:
> > On Thu, 2026-03-19 at 11:29 +0100, Marek Szyprowski wrote:
> >> On 19.03.2026 11:13, Ulf Hansson wrote:
> >>> As a follow-up patch on top, please consider converting the open-code=
d
> >>> polling loop above into a readx_poll_timeout_atomic().
> >> This has been tried and it doesn't work in all cases required for powe=
r
> >> domain driver:
> >>
> >> https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsu=
ng.com/
> >>
> >> Probably a comment about that could be added directly to this code to
> >> avoid such conversion and breakage in the future.
> > I am planning to revisit this in the future and am hoping that we can
> > figure out what goes wrong when using regmap_read_poll_timeout().
> >
> > Hopefully such a comment would only be short-lived, so maybe not really
> > worth it? I can add it, though, if you prefer.
>
> Well, I think I've already pointed what goes wrong with
> regmap_read_poll_timeout() in the above mentioned thread. You would need
> to use regmap_read_poll_timeout_atomic() and modify it the same way as
> commit 7349a69cf312 did for read_poll_timeout_atomic().

Thanks a lot for bringing this to our attention!

To me, it looks like the regmap helpers should really use
readx_poll_timeout_atomic, rather than open-coding the loop from the
regular iopoll helpers.

Kind regards
Uffe
