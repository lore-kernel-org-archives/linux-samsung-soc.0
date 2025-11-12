Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7030B533
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946891; cv=none; b=Yl5kgbb2emWxvWCSOOFlqPvk034IYkSWw1/7bppEbpo/gB8p0ENQrovGZNCx9aPI1kZZANtyGZ3zQbm4wdwIl+4MCFJv+DlSOu0S/7uONt0zMFC1b/ZhY1ykYVL43ycJzQ9TfEpxLarXrSJhbF/CQpB1iF8APQozqRNsG5n11Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946891; c=relaxed/simple;
	bh=1dYK7f4FkPzoZeJ51K8mDZvHGpP/FeIezNcDD5hERdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZVcMJDAWMULwT4I63yKz3+JFp+tFc4jo27gLt1IEF4tWVB23ao/1iyBS8K7N3EyYRrFphvAlgmc9uAxnpyXoDLpgl3BiwG/piultZQ+81AelhNahiCoFLoYzugVixa6hmx6Q5eHDU1nHnzdiM4+gTcs+AYXwjqqQ40xQ++g5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Agq4Gj7q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Agq4Gj7q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297ec50477aso4363855ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762946888; x=1763551688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=Agq4Gj7q75twnaldQoOyRwegmMpWfqRiAkSduaLyqfF9b0ngSBXUBtv38zNPxzZpju
         2LpRH+6BJo6spdCm8zZPmto1MLnrBLRUm0IpN6/mSkVf51HqIIPjhyJgDMSLvcMO1oRM
         MbjG3IMv5Lnbq8xDWQz1rKjXI92CnRArQ7ya+qWk/+lQyJy1mampYfS07KdJCS0becQa
         YfWSz7irenPniI+wFEEq7tfeB4zn1FuHmSABqEcIdGoti6+7BD5XeI+HUliFBkUsEeCn
         Oz+AG21bFX/eRk0++NhYJbsjsX5WIigS64HJwwEwNpZafC97iICeD7vbcHYl9cDYOLpx
         02Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946888; x=1763551688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=vjSLWrll622D8yAVYQz4XL70SH1+DkFqcwlHNk4WnjLvvsJ3ukiSS8YSsKCBFKmeH/
         Qplob7Lh7FjhPT3UtOt132BbyeKpz2ExdjDZhc4u7GPPNwYtcYjBORPnx8YhFq/YPC8D
         yKYy6pVGfsvZv9L4XE9C/FC+xHB1gRaa6j9zRqKXFb6psygiQh60vvNbjErdWdWdOShE
         ZkDOBeron6cJYFhg9ejoOW+7uvunP/O57XulHBYyv163zLKRHbZ0GWfE751obn8FYTsO
         OGkIqWVrHvZh/jQO4UvIlFQjHEO4WS6spS28MXXQD4IzsiQ7kf7dnoHewaHN05B2koDu
         4e8g==
X-Forwarded-Encrypted: i=1; AJvYcCW319dXqOifvpdyh4QGHND9jCiXhRy55/67cP4pNlT7kRuMcggdFr6tNV9fVqha47x293jOEuAugNv3eDzu8mj8jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwtDc6bGpS+s7fPPw/yPHgFty6+X/i9+uD5Jzcvc9wQeDhcMi
	2nks07EYj66jtej2wsaoqzNe/Ksd0h6c7tbCmJ5vFb5XZ8PQTFf8zb1AIakcgsP5/LJ11FYiVW6
	bEWYSD01ex+ekT4DhXUPTkw3aNqR021ZI4KskGwGx
X-Gm-Gg: ASbGncvfwoDqZF1mTVDaqfAQ6pd9640RoeqF9FR8rC64HXpXN7p+jK3d0Hk4JBlgbPu
	JxoNwA1Sh9lBppNBwon6CqilCJwvD5PQ7GvlrsJwz31omdqFG6pTIoGO5Nnq0CCBUsffV1Dbk76
	/QF1lqHV08jE6Zn78CzhlpUOedTqoz5C7eFck50xUeSKz0tVs+FrXNN7FzeD8d8xObM+ySTrlQM
	F25xDfoY0SVjAf9w0ECHKhBRIzn9/P4Chik+kGmIHnVhB+q3CXdIZK7+mC5FovELD3QCPmebX8H
	Om5Ntmn6afdlKN1qcwUKIqh2dSM+/6UKE2y7
X-Google-Smtp-Source: AGHT+IEzhYJUJIhP1itpJ8SMj4wfy7Edo9fDUXSWIfM11ytYomEi4CEvHvu/YvWNAK7+sehRmwWVHzbMhPckpBBMF6k=
X-Received: by 2002:a17:903:234d:b0:296:5ebe:8fa with SMTP id
 d9443c01a7336-2984094a5bcmr70869985ad.23.1762946887940; Wed, 12 Nov 2025
 03:28:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111130624.3069704-1-royluo@google.com> <20251111130624.3069704-2-royluo@google.com>
 <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
In-Reply-To: <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
From: Roy Luo <royluo@google.com>
Date: Wed, 12 Nov 2025 19:27:30 +0800
X-Gm-Features: AWmQ_bn2RT6EbgSb3mHFWKckHPwcrvZ-s2OqhjevpH_GhYx3Lcain4Rs18PGkFc
Message-ID: <CA+zupgxALZjF8m=PfYgb1QUgf0u+-Su0XYQ3VB=fCpM1dt9s_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 4:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 11, 2025 at 01:06:23PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..bfaf6cbdfec3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
>
> Doug just said SoC is lga, not gs5, so you need both to align on that.
> Actually not only you both, but whoever else is upstreaming from Google.
>
> It is not the community who should synchronize and organize way how
> Google works on their own stuff. Google should organize how Google works
> on your Google's stuff.
>
> Best regards,
> Krzysztof
>

Ack, will align on the next patchset.

Thanks,
Roy Luo
