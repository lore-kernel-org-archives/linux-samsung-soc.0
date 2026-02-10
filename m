Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28E2D193F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703135; cv=none; b=FZipHaTPWh38OIsMjyw+z5i9fVkOqAtJMExNcb5fuZpwBNJo+96sncVROQbINnjH/9UkGp6xE1SZxHyX9cMUiYgdYDtT5cxMAne8Iz0G5FmDeinUCE8KsB9cOVVTMm+ku+tiXqJ91XWl/VMeJRpD99p9htQxOdjIe9fyuiG3nWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703135; c=relaxed/simple;
	bh=nfuh6+izjFO8XKlIKCJxp3+e9ldOQyhtZbhKvPv8/ZA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZhxDKjFbWznUj+NvjBptIneYSKWq/qaqawzeM3MfnIBozDA0QIEtWme2zyEqwPnRApy7og1HnHzh3rSIy4htIocajHNxbuSFFOQkAe8/9Oc2sX4dguO+PQ8z1Vk1jesK11QmkUMApSHMNr8xRTO8Mm2BngJdzVBIn+eoe6P7Pak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnUOGHsZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnUOGHsZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso44802945e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 21:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770703133; x=1771307933; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nfuh6+izjFO8XKlIKCJxp3+e9ldOQyhtZbhKvPv8/ZA=;
        b=qnUOGHsZZgQxZAHMS+3zoyEndKhWIN+PHzkDX8TkuIuCbdYI+7r3OhjQSr2cYNMQ2l
         RyK6JdTbcixDJYsh40EEHVzD92ko/0RbwqZby+5txvAhWWb4Hh3ZFY0H2575VbzQCrUC
         SgJY1DeAf1lwNpmBPPgyWAw7OR3K4OIyD08dwGIXBZneYcGZgJow6kZpcpJbu41PDYm1
         U9d+Uq4K3+9zmhSJqsRfSpn+7eaVk2uok/sYXxNESngUXo8FkDvPfC1BR3Jpfn+s/tIg
         ZvKZVCkbsb5AUZF4cdJqzbCi7Z7m2RI23SsUGSoISCZ+yYlldCMCrQHCAym6iRjw0taM
         EDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770703133; x=1771307933;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfuh6+izjFO8XKlIKCJxp3+e9ldOQyhtZbhKvPv8/ZA=;
        b=iH11mSR5c6pG+qIesZw9HsKqWn/xnFgmBNsMSWoR8j9/1y62MudsP+caSSsjqWsr6O
         yvc+IVcLxn4FADApGwayJ8d9RF+tbpwejyW/1b+Yr6Le06Qc84Y+gca6p1X4tYeQ967h
         iLLhl0xoXF5TcDh73L8H/A3L18PO+vix03ptsg77XdpjJTTiyVsF1JCYnnp/BGM0u9xj
         GJKhuJHXkmHhewZWg5ZxuSyTJUBb/ADr6kGIM0Qw16BGUhj5Zy4Lp37RCGLwxdyR4f7F
         mPXdi2m4Yx4rcLRcylhzflZ0oCe4z32PON9ILtAOLxvAJ39hFT4ITHalT0xRTlcuEg+G
         USuA==
X-Forwarded-Encrypted: i=1; AJvYcCX0JmY2VoonUWTIfNJYsCLIW6u5w+o/eQdQ32jj5xhX8pEWhW4MpkIW3SIywHwa87yTsyDdZy+0Kl0uqTnhlzMDhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKhOCx0W3HtRpMmY2nKgoPUWd4Cc2MGYvPWiVd/U8X1kMivEM
	N4/NtWOQLuYAjjy7/pq2xByPQ/ZC8Y9KXX/wf4ZpM7vOqo3cQm7eyMDce3QCUJ3ANak=
X-Gm-Gg: AZuq6aKTbXIZsSBXbwOUYxjxFjPvvPmWQVIFIlPtS2oH50L5GTu+m91fndQsUfyQ7we
	TUZAHyXJJjOz6zmPN86AmYiNKGLQc0/B3W9OaXbXU6dXquhc8zYbSTkTSpLt6V6E6DsufNH//ej
	6Ihqd9AkWou9M7W5oIrLafnJmjjwxaDnQ2EGzXAvFSEHwcjivnEFXTymCZ7jzfhCzXPtiLJ14aB
	Mxz3gJtQuH03EYJ71dcDDRXCkgU2FzuyOfGT1IOxiifNpSAC4aj/yPmCKCOcc+v27/HA4omKn8F
	KR7JHj5Xz5SZOOPJuuv6SohEpsATUZVaLxfYkPdaYOtv0gayQvFjpS17wTSWE4AHOWwf4xM9Bet
	7kh2wuKlgOb5oIuVOZZ6DUgEkq+R16fLY3NKepEIheeVPGeHH1NGg1+FZ8KYyo8J7a+JV6TsKya
	MDkZG1Hre66hi9Jvp0r6djMT91DLarUeryZg750d6r
X-Received: by 2002:a05:600c:348a:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48320966729mr193678165e9.24.1770703132738;
        Mon, 09 Feb 2026 21:58:52 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm39954985e9.0.2026.02.09.21.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:58:52 -0800 (PST)
Message-ID: <4f1b1d857c0ee17436cd61e97219f508bd89f917.camel@linaro.org>
Subject: Re: [PATCH 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan
 Carpenter <dan.carpenter@linaro.org>
Date: Tue, 10 Feb 2026 05:59:20 +0000
In-Reply-To: <170a820d-b987-4fd7-acca-ac88bab9e243@kernel.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
	 <20260209-s2mpg1x-regulators-fixes-v1-1-ead348e64e14@linaro.org>
	 <170a820d-b987-4fd7-acca-ac88bab9e243@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2026-02-09 at 17:09 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2026 16:07, Andr=C3=A9 Draszik wrote:
> > The sanity checks being removed in this commit are useless as earlier
> > code checks for out-of-bounds conditions already. They also are
> > incorrect (as they're off-by-one).
> >=20
> > Simply remove this incorrect code.
> >=20
> > No functional change.
>=20
> If they are incorrect then how it could be "no functional change"? To me
> original code looks buggy and this is a fix. Fix must have functional
> change...

Earlier code already checks for all conditions, including all error cases.
So the code being removed here has no effect, as any potential error it
could catch will already have been caught by earlier code. Removing it
therefore doesn't change behaviour or functionality.

I can reword to 'incomplete test' instead of 'incorrect code' if you think
that's more clear?

Cheers,
Andre'
