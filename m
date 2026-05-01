Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7F372684
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 May 2026 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777630990; cv=none; b=L6aGv2YHetjijrRtln/FCaBUpcdLzdap192gYOLwDTsxvyvRnqVcyeR5JKJ0y+ICdBcaYu6yaHkxLE5Nl7WyO2akfoKuEL+1tDoyTlZ289BLgrDV3CAyb0YXna+CyWiEiS/ot4Uub7BGYx9EbAoKBjrHPQolS7BzCQIlyldJfE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777630990; c=relaxed/simple;
	bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRamEKyb1KlOZz/+3gjwQC3J2UZk6ZH6nG58R/9Gev0ddNM1zhmMD+vvNCIRO7y3EEC6/R1hgZx72Qx6tdQmTwM+YNelQB62gfVnNAL95zdJy/mCQUUboHxenyNd/u4fgZMCt8QYkKj9fCv4jVf2LjM5oGRH1waLDj2jLYVQsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHUzMw0v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHUzMw0v"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1113384f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 May 2026 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777630988; x=1778235788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=;
        b=YHUzMw0vecRmjOyhvTytv0zpgcejN/n1jB9EHV+fds1Yyg1nQk2fVwmjFD/KFEc/T0
         2xJbCFkI7Jd8H91UtIzXHzd3GAYzaVJhs0fWLTG/m27wVsNLcmFHRIlcVYtjY/p6N5kg
         Q+ACexBrHSA1oB2E2i9l6T1uCpAzdnght7voTd8vtmgZDUb2OdAlDYKW5Izk6u90v2Sj
         Rm7evl9F7huI6TGrLz7Y9qfaYwQ8IlEJKWikKFU6Zl3iNRbjn0GEeztLyPxRaDuZ2sSw
         uFP0nwGFYBLo1Ai0OHVYqOKvQZ44TOnQXrYmxhrAKKSa2w54oD7m7o0hHnEUbQYK0YLo
         VH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777630988; x=1778235788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=;
        b=UNIwSv27w45fT54zVxD9BhUQ63+EuEtaAghsjN5NhcDXO/iQMOMxwyGVvSrib4ivsf
         CLKI57V+9fHOYmgrwL9JWljQdwqzLJ6JNdbHA/WY5qUIMDijR4mhRodm+rCwp3Mewm/N
         1NXdH65XtldxEwPT/qR8s/+hXUjYAqNAMvtDby0D/pdgTswDjVKIBeGJXVoaJoEWNhSu
         F5tXNBBTfufmZkYaum5/jmbxBSH71jQH5DbXm6DJPdqQsexgW/iYXPSCJZum7jCuvWpK
         i8UsDuMrIZ6xK8qP5uzsgfy945SROXQQ1zJHmaHhF2S180ShNDn3aaEtfvuI8QrNsQGk
         QI6g==
X-Forwarded-Encrypted: i=1; AFNElJ8AknglBBiC2dxWb1NnntSInn4Omy3hIF2FGA/pH3STDQdOipwcG8aSbk23g0r53Y2U5axhDvLCLNUNYi+kp1d2zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7RTs8aWglmGZ1U+8ZX4O3jvyJqxRnCTI0wbTSSu7FOB1ijGv
	7Jdos2msRR40fgRdTp80iRaG2/vot9Qd/NSAnZigDiuHQWqCDkEvnxt+jdkaJt6tT64=
X-Gm-Gg: AeBDievTqhedio19sUCB55x4XJfU9TFtd2Omog1yjojYg9ezxSDx9xXJVo09PInFSQ8
	zMlhLUF7oEwxPh1SnmDbBOziW0ntE8OydIBeOYGB9iZ7FiKDnhw6p4GXSYEmBfl0tDTmjRPNDMS
	8xBcY8UuejDAGeIiOVdWCSpmvhm6PgGGeR9VyDY7MvnKH7L4rXJvOz9bOG5HNwbMdh0+P3MzYl0
	OJdK6sq9TOnwj4hbRKH22ZouJdF6101WGKtleX0nbAuEOoEd24FEMGLU1gh8ItXtKHvpHlOkqiG
	LxUnpgVX8qcnac3AMFnJGBkvI5+VELdIeLG/vdHDGDLc9eEk5IJPxglJ/M6yACVh18p67hQsVJH
	SSkhrlUw8c3TkyFf3/DhsBzaHQitUydMev7wSKhbsNdlHkjKLKJeLr+jPFVAngyooj5E49e5cU+
	pL+QnJqygHGb5BFEcx51qsJcfAZWhKDWDIxB2KdE5OMpI=
X-Received: by 2002:adf:f001:0:b0:44a:8880:ffd2 with SMTP id ffacd0b85a97d-44a88810005mr2603191f8f.4.1777630987660;
        Fri, 01 May 2026 03:23:07 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44b63d78692sm60672f8f.27.2026.05.01.03.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 03:23:07 -0700 (PDT)
Message-ID: <380547be-8eda-4395-b13c-b6cb6804ec5b@linaro.org>
Date: Fri, 1 May 2026 13:23:04 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


FYI, sashiko identified few improvements for the current set.
I'm preparing v4.

Thanks!
ta
