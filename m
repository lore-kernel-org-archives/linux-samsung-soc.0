Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F13FBEAA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677258; cv=none; b=Tn0B3jlblyPJWazNVFUhEkOYQ9iUUocBlgjx7YMGYWAokHKhgpHsjIJmFe/3HTzTz4ahk/hvs+XvCV6Nf7zThx43/u1gvbxD8D7pvmDPu8TJYSUGJ9e/RdNsriFGds5jJKmzUqCUh3/Jn9iyRKKC2X2px9ygGW2frEV8l6qVSw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677258; c=relaxed/simple;
	bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sX73GxiJsnaNZxT0HXFCr33WWCXcPTnAXO3hR0/ftWQm6/j9imdPdVW7pnM6hOJAykero4l2LCgIx1HKyExsUZ7QJz3NQOqwUm6m/o5qvakspRnKu8Ms2So7hTFkeZt1PDdC9KpHk07ywMzZLe8ou7nUasNUBhq0FPX5VWiXVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip/hqoeG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ip/hqoeG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47d70879764so474294f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783677252; x=1784282052; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
        b=Ip/hqoeGAr/myjEmeIAVuqq/vHDGOW82Jij0v9V7U9rEvPVd9xIOWYyooT6BVXBmQX
         oQtmGVl0uMY1ruyFgsmEHUkL4uUGHUyVEIfFDGOZQIlD95I00sEkYCvvLbsUVaCRcdE/
         21l9ux9MUb0iFF5oP9hKQH6roO+9UKLSfUNsGIWQFMT0Tc948Tjponv4UABojt2vCMnC
         gLTlIF36tLwLlPnNOmJ3i9z8rMMq3NEiQtkOpsuomare+m7yXnB+/mZ0F6cQEI72XISf
         Mm8Wpf/L6vFfce6tR71mQY2uUfqusyRMIGEgWKU19OdDbVQgTfvp33yjhc0PQ3Zo1D9L
         hSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677252; x=1784282052;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
        b=CRY77nq+YEHmAzlpCkfPq+ZUUBYAOPMSH5xHUMdDps93oHbJlZfHqNWp7L0bnqaFD/
         s13zyXkqmOaBPyqxj3UzkPMPkYanXxSlSqRf+ZTjtPwh1MaxpWk9+m00yIeHjDDh7oyG
         PS3IjpS2yKhi6iPkyt8PogB0jNT2POGC6OydV9sy+/OsdcxHgo0Xu/3HTMRN59jh3o2A
         OJkUe7LmVvMg2HzoeNXIiuJehAlPjaNvhcoJOEA2aIV205I8vfcXAKTMK3CxCkoSeDb3
         Vu3OCnsV6TPuelBfl+NTWXMX1t8zlJUgBsstLVqJQMaF8GiRoi/c7asI47GInl3wX6Ol
         oC4g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9H8BZXAO8U5xkAc92yiPkEXMb+1B6rpw7fE3yb9zhxJd414CsObs8yv8h6eba0pLI8VElM86LyFS57EAkGaPymQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQA8Wc0uHOotEg+Irn1f+oDgCxXlaSSfeJtlEJjMDxlATAFoC
	WSHGOD76RLNOqqr31lZ2ETzZXUk9+Z00Y8HPkCO20VwnGjFmiX0iTkWUNVn3VWGTHXs=
X-Gm-Gg: AfdE7cnenCyXEQDVl+bAAabH/9rqNjwVwdFkE/UQnT96pnLxBvxk4hFUW6jwH00oKdE
	9pky67SViWhon8S54mrhm/8WISjg35D3JFUpWJ2piIv1OE6Em9CAirW/UsyR1xrEDevWCxjMLGi
	YSV+YwIAu2P8W7EIdgcRWT7nXVRubYvZ9ZuuNtN+9J2YvMWT12yLftoSw7QwduyCbmrDB3GsmxK
	saUR5nHs3fR2Q/yL/SBNsRtX1HVgxx4CQz6SbS2zaXH4Baa1zG0FypB9gPgjggy9/iNrbYr/B0q
	Ubvbw5L07VNcTI3ZhtBZvRn5qgDcP6+OuAoB+Ed8QjNPW+tW8TsFUqHOJ4oCHIz58VSQdhB+fXO
	XItRmxrQHQ0J7eBh2fwQ1K9yKS8XW+LIy44k8pZ/8UZ++tAyK1HcCS1/wqlfPFPDI3hYOVstvvQ
	xuqFoocuI+DDWIh55kPux4TWmn
X-Received: by 2002:a05:6000:27d4:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47df4416019mr6854730f8f.25.1783677252374;
        Fri, 10 Jul 2026 02:54:12 -0700 (PDT)
Received: from [192.168.219.26] ([212.129.74.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm55993210f8f.23.2026.07.10.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:54:12 -0700 (PDT)
Message-ID: <a4003ac352f382fa4ff329acdfa561eb06e77289.camel@linaro.org>
Subject: Re: [RFC] Significant Random I/O Performance Regression in Linux
 Kernel 6.18 (Up to 27.7%) Likely Caused by Commit 3c7ac40d7322
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: =?UTF-8?Q?=E5=AD=99=E9=AD=81?= "(Kui Sun)" <kui.sun@unisoc.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Bart Van Assche
 <bvanassche@acm.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "\"Martin K. Petersen\""	
 <martin.petersen@oracle.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam	 <mani@kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  "linux-samsung-soc@vger.kernel.org"	
 <linux-samsung-soc@vger.kernel.org>, "linux-scsi@vger.kernel.org"	
 <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"	
 <stable@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"	
 <linux-arm-msm@vger.kernel.org>, =?UTF-8?Q?=E5=BC=A0=E5=A6=82=E6=B3=89?=
 "(Rain Zhang)" <Rain.Zhang@unisoc.com>, "cixi.geng@linux.dev"
 <cixi.geng@linux.dev>,  =?UTF-8?Q?=E5=94=90=E6=9C=88=E6=9E=97?= "(Yuelin
 Tang)"	 <yuelin.tang@unisoc.com>, =?UTF-8?Q?=E9=99=88=E6=96=87=E8=B6=85?=
 "(Wenchao Chen)" <Wenchao.Chen@unisoc.com>
Date: Fri, 10 Jul 2026 10:54:19 +0100
In-Reply-To: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
References: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Fri, 2026-07-10 at 07:17 +0000, =E5=AD=99=E9=AD=81 (Kui Sun) wrote:
> Dear Kernel Maintainers,
>=20
> During our upgrade from Linux kernel 5.15 to Linux kernel 6.18, we observ=
ed a significant performance regression in random I/O
> workloads=E2=80=94with a maximum degradation of 27.7%.

[...]

> This issue is particularly pronounced in single-threaded, small-block I/O=
 scenarios=E3=80=82
>=20
> To illustrate the impact, we conducted benchmark tests using AnTuTu on Un=
isoc T615 devices.
> The results are summarized below:

[...]


> Root Cause Identification
>=20
> Through investigation, we identified that upstream commit 3c7ac40d732232f=
ec0ba31d0a5e3cc9c112fc2e7, merged in April 2025, is likely
> responsible for this performance drop.
> After locally reverting this commit on kernel 6.18, performance fully rec=
overed:
>=20
> Table 4=EF=BC=9AMixed Random Read/Write Speed Scores=EF=BC=88After Revert=
=EF=BC=89
> Device=C2=A0 Kernel Version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Test1=C2=A0=C2=A0=
 Test2=C2=A0=C2=A0 Test3=C2=A0=C2=A0 Average
> T615=C2=A0=C2=A0=C2=A0 5.15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 18604=C2=A0=C2=A0 18314=C2=A0=C2=A0 17732=C2=A0=C2=A0 18216=
.67
> T615=C2=A0=C2=A0=C2=A0 6.18=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13372=C2=A0=C2=A0 13081=C2=A0=C2=
=A0 13081=C2=A0=C2=A0 13178.00=EF=BC=88=E2=86=9327.66%=EF=BC=89
> T615=C2=A0=C2=A0=C2=A0 6.18=EF=BC=88reverted 3c7ac40)=C2=A0 18314=C2=A0=
=C2=A0 18604=C2=A0=C2=A0 18604=C2=A0=C2=A0 18507.33
>=20

Thank you for your above analysis. Your numbers match up well with my own
observations at the time in
https://lore.kernel.org/all/88d31a258feb36425ad73d0323077972f85f8341.camel@=
linaro.org/

[...]

> Request and Recommendations
>=20
> Given the tangible impact on mobile user experience, we kindly request th=
e community to:
> 1.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Consider reverting commit 3c7ac40d732232=
fec0ba31d0a5e3cc9c112fc2e7, or
> 2.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Re-evaluate the proposed change in light=
 of its effect on low-concurrency I/O paths, as discussed here:
> https://lore.kernel.org/lkml/88d31a258feb36425ad73d0323077972f85f8341.cam=
el@linaro.org/

While originally I was trying to find a solution that doesn't regress exist=
ing
platforms and still works for the newly added platform, I can only second t=
he request
for revert, given how important UFS is for mobile.

Mani was also in favour of reverting:
https://lore.kernel.org/all/4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvk=
ja4@hjli25ndhxwc/


Cheers,
Andre'
