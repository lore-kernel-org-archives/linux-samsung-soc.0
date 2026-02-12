Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27D346779
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897819; cv=none; b=WjRojOknO6BXq5ufHYngHrj+MXyWF5fTz5SGowzhs6SikhQ3QhIflWNPYGnq/gcgara6juhASbwNE/+PDJoQ6TN6oS0vqyte6wjB73p44eoPfDcVxSyNtLOMkeas6FgSnd16ZAhdJ8VDwkA9LTov9llWwBQW+E9CXeIs4HsYXe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897819; c=relaxed/simple;
	bh=orrgARdRVXY24gkPcC6wmruEl81dP2QFKl4esYE/FQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DiM0Khtwu6b8HOzTvR+4GcV8eGq/NGOAGc4clwKFEjUoa9Iq7HiGAcRsOq8zhlswMm8+ogIw+uob4gQKhRMToKZ/iecwa+l9xSjA71DqyFOeQcBORjR8jw6s5rEIA2a6EgR5YgoyYnZe5gSiC5y4acIR3fihCRr88A4SmSUo4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPevaUBM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPevaUBM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-436e8758b91so2957318f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770897817; x=1771502617; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPXBLe0yJUYbIoGyT5kMiHrz15M67LzrqjA/DC/nqFM=;
        b=hPevaUBMTdCmjZpAIUz7m6NyBYoypy0QXWXugrn8NpEoAZXFHNDiiVOl2Smyqm4YPk
         duPm5qjppAE7oLpC8XXBzbDWq60ZRcG12QbaR2uXf7ONwcFatznIFD+oNs4fpUh2Ui8E
         xlgvLjnhdqxdRlZSIPTM9nCFj4AY0/En66eOiSDmMGrA0z4qIhRjtp+cGju6MOgub0d8
         F2mg7IFc+KbfPOAI8mt/PwHDSYaDxlWkX2hA7gjiivtVKrQ4xD5WSMGQLJkQjeAHaFcM
         APc/D+5Wdu4XdpcFQhN7B6YXPd4088r7i6+fHkw42j0DTzABWXajFLe+BzuFDXBda3ZH
         KDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897817; x=1771502617;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPXBLe0yJUYbIoGyT5kMiHrz15M67LzrqjA/DC/nqFM=;
        b=e99ZQzFbT4XxZ0MoQFGErG1LtEila7BkiCuljflnK6fBZGvojovTPvhYtW9TYUE41B
         D6tC8TEKSq6ByiwN/MKOxgpFQcX9DzJ0MuRMS7WNVHPFdeh0VGh1gLhxOSLLhLabzPE9
         bfQGUSGjXSJ65tX67Bj6R4c+8Wp9nJFp7PJp4p/UHFq/ov4aUT2HE59Cw1LgO+WeDW1F
         UZOOLh72Wpmh0To5Y15qeOyyJ0a0rn7ThFNKKAtSar+QYuxwQnDsnAiuTrLIYeabXSlL
         2cWEZ4do97ZjHSIl1a+riK3G5p255f6NK4bxKTltYEbp/bIBc/09YCau/dWtqa7glhFQ
         WIxA==
X-Forwarded-Encrypted: i=1; AJvYcCXRmyR9eV5f6IbHY7M6EFNTYG3rHcLLQbwaMHvEQrj+CkVHevoCRYV7T/ThOyMRf5aY2BEZrk3kzhi2bQJPRUKz4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRHQ/nCPIjtXuBaa5q2kVVumVWF/ufPSWm6PKeBeVZ4JhlCon
	XQYqOnlxQnuNodSn3dRfUO/7sREyuF8E+HIx1jjxt0I/p9Nc12a7kAscEcXC2TZD+vI=
X-Gm-Gg: AZuq6aL4uuPvyuHdGfpv832oBUKTwbaG9yaqGpPnHwtJ2Mee+MtVJ6l6hAHS4CTN5M/
	INtAhrJ4tjgupIjcjH5oA2m7kdE84LLu5968ntRAAcrzCwMZUGoRijOfloT0D6/H7RjsdjESrrA
	jMccQWIpN4zhHgulDYIS/mcKa1D+6SDG6nCiRmeQ3MmyLSsFcwlz0A4QHrG0cV9zdb+zDtr3iTg
	8y6GkfHYV8ZlPm5VHisTpHS83Rq+mSElA6VbbhEj4LH8CKj306+FTI6Q66PSv8PhCKr+UWW7HFP
	WRIKIvU/9pHTOmehsE0dy1FQxE/m2EhGuUZQFYGmu/WgJMBZI9EYdLQwnCo6mICfIsRvkKypZ0V
	fUbpbMO/j2DNvfWI0mAZ0JYqYDqMA0fW0zHVw8/5wnknZXT+1xLvIT+r+jaokP9JEM5aiRFCcmC
	gHbH+CFI/B2UjllcrLmCEBXwSesUU1Jipa5+/ihGOR
X-Received: by 2002:a05:6000:2901:b0:436:233c:c7c2 with SMTP id ffacd0b85a97d-4378aa0c732mr4446267f8f.16.1770897816772;
        Thu, 12 Feb 2026 04:03:36 -0800 (PST)
Received: from draszik.lan ([212.129.82.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc8b9sm11365172f8f.24.2026.02.12.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:03:36 -0800 (PST)
Message-ID: <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 12 Feb 2026 12:03:38 +0000
In-Reply-To: <20260211211229.GA3882182-robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
	 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
	 <20260211211229.GA3882182-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Wed, 2026-02-11 at 15:12 -0600, Rob Herring wrote:
> On Thu, Feb 05, 2026 at 09:42:32PM +0000, Andr=C3=A9 Draszik wrote:
> > The power domains are a property of / implemented in the PMU. As such,
> > they should be modelled as child nodes of the PMU.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > v4:
> > - consistent quoting using " (Krzysztof)
> > - add samsung,dtzpc to example
> >=20
> > Note: Ideally, the newly added properties (ranges, etc.) should only be
> > 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> > as they're needed only in that case. As-is, this patch now causes
> > warnings for existing DTs as they don't specify the new properties (and
> > they shouldn't need to).=20
>=20
> We can't have warnings added if they aren't valid.
>=20
> > Only if DTs are updated to include
> > power-domains, such an update should also add the new properties.
> >=20
> > I've not been able to come up with the correct schema syntax to achieve
> > that. dependencies, dependentRequired, and dependentSchemas don't seem
> > to support patterns. Similarly,
> > =C2=A0 - if:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
> > =C2=A0=C2=A0=C2=A0 then:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
> >=20
> > doesn't allow patterns in the 'if' block (or I didn't get the syntax
> > right).
> >=20
> > Rob said in
> > https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> > that this is a known limitation in json-schema.
>=20
> For a given compatible, you should either have child nodes or you don't.=
=20
> The h/w is not variable. So something like this should work:
>=20
> if:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: foo,bar
>=20
> then:
> =C2=A0 required:
> =C2=A0=C2=A0=C2=A0 - ranges
> =C2=A0=C2=A0=C2=A0 - '#address-cells'
> =C2=A0=C2=A0=C2=A0 - '#size-cells'
>=20

Thanks Rob, yes, that works in general, but unfortunately in this case exis=
ting
DTs don't specify ranges etc for the google,gs101-pmu compatible. (This bin=
ding
is specifically for google,gs101-pmu only anyway).

The above suggestion will cause the same validation warnings for existing D=
Ts
which is no different to just adding those properties to the top-level requ=
ired:
as my patch is doing. Unless I misunderstood your suggestion.

The compatible doesn't change with these patches. So I'm not sure how to ma=
ke
your suggestion work without causing warnings for existing DTs. We can eith=
er
have an old incomplete DT+binding:

	pmu_system_controller: system-controller@17460000 {
		compatible =3D "google,gs101-pmu";
		reg =3D <0x17460000 0x10000>;
	};

or the new one:

	pmu_system_controller: system-controller@17460000 {
		compatible =3D "google,gs101-pmu";
		reg =3D <0x17460000 0x10000>;
		ranges;
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		power-domain@1c00 {
			compatible =3D "google,gs101-pd";
			reg =3D <0x1c00 0x80>;
			#power-domain-cells =3D <0>;
			label =3D "eh";
			samsung,dtzpc =3D <&dtzpc_eh>;
		};
	};

I.e. in the old case (when binding + DT were incomplete) ranges etc. are
not 'required' (and shouldn't be), while with the power-domain@[0-9a-f]+
child node(s) added, ranges etc must be specified.=20

If power-domain@[0-9a-f]+ wasn't a pattern, it'd be easy, but I really want
it to be a pattern, not least because there are so many instances.

What works (at the top level) is:

    dependentRequired:
      power-domain@1e00: [ranges]

but it would require spelling out all the instances instead of a pattern. T=
he
following (or various variations I've tried) doesn't:

    dependentRequired:
      power-domain@.*: [ranges]

I've also tried to come up with something involving dependentSchemas:, but =
to no
avail.

Similarly,

    allOf:
      - if:
          anyOf:
            - required: [power-domain@1e00]
            - required: [power-domain@2000]
        then:
          required:
            - ranges

works, but when using a regex, it doesn't:

    allOf:
      - if:
          anyOf:
            - required: [power-domain@.*]
        then:
          required:
            - ranges

I've also tried:

    allOf:
      - if:
          required:
            - "^power-domain@[0-9a-f]+$"
        then:
          required:
            - ranges

and

    anyOf:
      - required:
          - power-domain@1e00
          - ranges
          - reg
      - required:
          - reg

and

    anyOf:
      - required:
          - "^power-domain@[0-9a-f]+$"
          - ranges
          - reg
      - required:
          - reg

None of these seem to do what I would like (even the non-regex one).


Cheers,
Andre'
