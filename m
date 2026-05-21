Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D043ED103
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370656; cv=none; b=PxnMroO1Z8irWvlROKVMwJ4B6Ik77IXPCXaiAFCnZy4ChFyHpgEqug65E5oJC1K9iJ17x+5KOkaAOX1zb1uOUiOVGcf9NRusHavCYK12/OBWg/zusVjRyJ8DnXSUDQwFFOieU7G/d8vG0rNuTGXaXGDWKE824pOF0bEEhfn78us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370656; c=relaxed/simple;
	bh=Ks3+rpy46FU5SfeZckGpUYKSWPJ7B/Tafw2dsVlfXZ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=n62gGdhFnz5ersL0/Cq7R1JVDE5DA8I+c4dRzcWeqclN9yN1xPNtk/xfTD0F6wASOr15/ApQ1lWwWsG00/rtyBwVyO6xQ6XJZ1XPt9DuC6enfFa8Qiv9IqP9c3cNXBR+jVf776nG6DpUzSSBWPqp+jr5MgR5jzCaf7nabWuIamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9g4oMDl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9g4oMDl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-444826c16ffso5511564f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779370653; x=1779975453; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMlAK2z/O8nXAXVGpgv2TVPDYvKc2M33iVdUjIQEOVI=;
        b=j9g4oMDlPTX1vmuxUA2/wDDvpem+0BSJlHdFpIGuuWpsbTyEwJlznC79mKi1N1Tb5i
         RcztslsP95zC0710ovVdm7Cm9jJ+pCPvmmZKiHxv37x9kWpZZKlZCMmBznz7bX4QUFOk
         UIP6RgBriCsV8tIU5pFW7uE84GZW52pr9V/ze3dFsk7WwtI0PzunqRL+nbcUEDFdJak5
         YUibK0af/CZqGd+bkQ4YrDgG0LcMRPcTQVquFNoX4YxXARLgibm5h85h5n97/2YzzFbW
         4KGnuOffL5CtfO/mYiF8nn8E/y4/EslhQ8tJqbQyWZteFjXDmPWLNSxLH8JozS9ADxyv
         3k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370653; x=1779975453;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMlAK2z/O8nXAXVGpgv2TVPDYvKc2M33iVdUjIQEOVI=;
        b=LpsWu8ZjrklZSkd9YpOs44XVTiMWyrPuzrHTJTVwln+qc8/q1DW/0rJk9unu5arYyG
         hv/CrITRLNErO7vU9yUxh3EqFZ9cucpg6sCLzzwPvBTvZoPUvo8gIyFjojpCGrpqdXiL
         MOz8/121IXF0GFeNFopGP1PnA139YR/ZTyd9ZtaLdTD0w6D7jMcj3cxbsDVXAfcZZpv1
         RklpIsDwsFeTQLGigimXns+TR0vJThWKC9dV1GDvAqQE1q2dpDL7wEKAwmYnpHXXl1ip
         KYZVsOSa2G4/Q3fb90Rl9TG6Z91HZJb8Yf96YROVEgCdaHk+YBDs/GWH4/XG6wjcw1Fv
         wyhw==
X-Forwarded-Encrypted: i=1; AFNElJ/B7rMSjXd5bjAM7iP4IiXnTpGbwXKsL5bxGvBaLWBxlc023Sw92WfeqXjgNT/RWDpHszjOnFeS+NYKWWCCxYm/eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLHBieeFO0PLpYY34ahaKqpc1K6TcyQ+IkV/xnStt6MNHOgiE
	DCtP9YTuPSpwAjc3kRH0aUUdQgv789Bdqm5SmiGQRS5GIVkS2HcacmJRH+DQv4Y/+pk=
X-Gm-Gg: Acq92OGvw/C0jaRAeC9uOtIprLg3kGJsZHdeABwWrluIAt8LTK0xpTPvuUi7dTrOJIX
	AzjxHgpjRGqZSWJN3WZqUkGt5kTeMAkh+7G4HOrvlhiMJTTninX4hsHNp4wSgnltNkvcqrWZ0Ta
	m5y4DCZkBq0CO0hrBiI6i0P7oyR7sYewuBF6OZDzW0HdeNa1FrizPPCBAmLVF53h0DXIwtD60gD
	BeU4la/sc6RbMwgKDb/x7fs3SwJlir1hl93dJd8zBPTuvsHGU0xH7IkOp5Xq1xeAC7+fDGfh9rn
	F829nl2Wigo/r/eSFn5FHgCIPZPb1g3KEjuvTceJeaZ7Utp6EJA68RvL0QWIC8GOVj8yMxdR4wW
	iBr2S/QH8XLVzjQtN0oz8CR7F4ZPt6QT73rgcpvUsRANlza67R8sXnzgTKpEr3l6Y4lmbsilzOS
	vJEf57c931/mOcsG35urshJ6GG0RDi6LO3asJfCTG25nkya5hl+dvhrzf3e2jTDib212QUqRSxq
	z/egdqFF2xBcCG3Pw==
X-Received: by 2002:a05:6000:41fc:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-45ea344aedbmr4835322f8f.0.1779370653284;
        Thu, 21 May 2026 06:37:33 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:7fde:b714:8ff7:ea6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm4331310f8f.6.2026.05.21.06.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 14:37:31 +0100
Message-Id: <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <jyescas@google.com>, <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
In-Reply-To: <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>

On Thu May 21, 2026 at 9:25 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Wed, 20 May 2026 at 22:01, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Hi Tudor,
>>
>> On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
>> > Hi, Alexey,
>> >
>> > On 5/18/26 2:24 PM, Alexey Klimov wrote:
>> >> Thinking further about this I'd humbly suggest that even
>> >>
>> >>      if (fw_err >=3D 0)
>> >>              return 0;
>> >>
>> >>      pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
>> >>      or pr_debug(...);
>> >>
>> >>      if (fw_err =3D=3D -1)
>> >>              return -EACCES;
>> >>
>> >> some debug message would do.
>> >> Perhaps we need some convertation, for instance as it is done in scmi
>> >> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have a=
ny
>> >> data for mapping acpm errors to some human meanings.
>> >
>> > I did that for the pmic helpers. I don't need any debug prints for
>> > gs101 TMU as I have clear instructions from firmware: 0 for success,
>> > -1 for error.
>>
>> This doesn't look like a right approach for upstreaming a ACPM TMU
>> framework.
>>
>> You are trying to submit a gs101-specific implementation masquerading
>> it as a generic ACPM TMU framework, while explicitly pushing the
>> refactoring work onto the next developer to add support for other
>> SoCs in this generic ACPM code.
>>
>> The ACPM TMU protocol implementation on Exynos850 is different: it uses
>> different error codes, and half of the calls in this 'generic' driver
>> are not even implemented in the Exynos850 firmware. Relying on a
>> hardcoded if (fw_err =3D=3D -1) in a driver named generic ACPM is broken
>> by design and may silently swallow critical firmware errors on other
>> SoCs.
>>
>> What about such options below?
>> - rename the driver to reflect reality: rename this specifically to
>> gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;
>>
>> or
>> - abstract the firmware error handling paths through driver_data or
>> a dedicated ops structure now, so that other SoCs can cleanly hook into
>> it without having to rewrite the logic later.
>
> AFAIK it's pretty normal not to add new hooks before they are
> required. I think the approach taken in this series makes sense, as
> it's the developer adding support for SoC #2 who best knows what the
> differences are on their platform versus what exists upstream.
> Similarly, the developer adding support for SoC #3 may have different
> requirements to e850 and gs101 and that developer is best placed to
> refactor and add hooks or quirks that are required for that platform.
>
> Let's not try to boil the ocean with this series, it's targeting GS101
> support. We can evolve it for future SoCs as those requirements and
> differences become clear.

Peter, I agree we shouldn't bother about hypothetical SoCs. However,
Exynos850 is not hypothetical (I guess SoC #2 in this text). It is
possible to take set of patches from maillist, copy acpm DT node from
gs101 (minimal compatible rename) and it will be Exynos SoC with enabled
ACPM. I am also actively working on it. Hooks or whatever other way of
handling firmware error codes are required now.
We actually already know the differences: different error codes and
only 4 ACPM TMU calls are implemented on e850: TMU init, TMU read
temperature, TMU suspend/resume.
Extra TMU calls are fine since we can just do not use them from thermal
driver but hiding correct error codes, well, that's another story.
We already know this way of handling firmware codes is not ACPM TMU
generic.

The ACPM TMU part of gs101 ACPM firmware might be a vendor-specific fork.
We shouldn't assume it strictly adheres to the reference Samsung ACPM TMU
design.

Alexey

