Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49C86ACD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707336546; cv=none; b=sMsFDmSlXkj/Lgu3AU/qslRCALBy8uwC5hKXJFPVv0jysIX04+7BCor+gE88HNUHhBhS9zlRXQs3aSThbYNv0jvaCq89NjMV6cUHUJ/Is078IUsYuHF2s4JVWgRuLHea0sDqirWDoNYOFzkBvHU1ATk/i5cSAIRiJUA9NEdEZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707336546; c=relaxed/simple;
	bh=hCOJbVOiZUdazhhlT6BZT0ENln/B5cF1mKAog3ykKSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZ9ra+xpWXCYcJQdhzjgfLTmf5nzASG2zLHSj8Utp8U9cyXmNeLnJJupcfRdlV8TeZgQaXpdR6DEW1YS7LSgM/WjqUTLb1WuPAucQwVZB2UaYdR0YSONKLkxo5nsxncxN6DnPXJXIO3Ig4DbsZoGDLDBUaaDbo3A82FAp8ggF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bfd40ff56fso539440b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 12:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707336544; x=1707941344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hCOJbVOiZUdazhhlT6BZT0ENln/B5cF1mKAog3ykKSc=;
        b=V5nzpyjnwkbC9A6WGFfFOs9uYi9BCbMfbImR47LqlOvE/ZIondreYhBWdwICT47Pc/
         lnFyJxH5IcV8zHx2qlAGq/p2G9IWKqzH6ynVUWXz8hdQY/1d+pEBfplOlVQxtZa8h1pe
         oMCLDuloPZweA5Gh7JJ/EGVkNKYSURtXX7NiTnDqPtxXzJlMy2UZJG1K1B+71OUsBKbw
         TGv7HVQBRdRo5REPsNqhDwMnnhAfN5Zhy4m2k8BIUOsa+cMQ9LASIPGtX6SixEQc6YOJ
         XZizBQ1gKG1ad+aNwZr1Pne5aXW6k4Yg38Q5gCmSubW197iVHj1yw0dJKpUmfcMDbeLY
         NdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNVEJpHS3czLnkKcfS+p3mNT+ZEK6g9jJC93Wvj0qZ5ITsHxRNPbtPTvUVNvP4QEyqQdW3B7rXFLI0O4WmsVpTlHMUEWcEOg2e0ens8A7OGCk=
X-Gm-Message-State: AOJu0Yz+HuZLArnx2W+IHB7vN/My4wcuq2acGF0fZR8fSe6aMMBx6wSd
	g6QpQNdXJFgV/pGVi9eazACLD/Y4JIN1WEuv+RrxOmOk9ARpsQYQ
X-Google-Smtp-Source: AGHT+IF1HRxPKjW4TNIe351EEJA601cK4K7mezn4iQo2dKf7sLQSs19agivdHBN21K4pbYmcQ4CeFw==
X-Received: by 2002:a05:6359:4290:b0:176:4ac9:5509 with SMTP id kp16-20020a056359429000b001764ac95509mr4241806rwb.13.1707336543476;
        Wed, 07 Feb 2024 12:09:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWT4veTxekthAm5PCd6rBHh6iGYPeZ5GaIJE7/R76cn7797Qx7iN3T3/wvqmlAa47ayojHrzJmuA4ZGrnmo+zBwcEJ9rsJhZnufplONEMQyTnl8tgv42nk5DT7BzJMJ0sTA/VtJ5kMNzA3q0GskEisexUsC6FdFR+rNTYn74+1G
Received: from ?IPV6:2620:0:1000:8411:8633:8b18:c51e:4bae? ([2620:0:1000:8411:8633:8b18:c51e:4bae])
        by smtp.gmail.com with ESMTPSA id b64-20020a62cf43000000b006ddcadb1e2csm2092236pfg.29.2024.02.07.12.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 12:09:03 -0800 (PST)
Message-ID: <361a2078-10a6-4290-b671-e57a0d1e3a0e@acm.org>
Date: Wed, 7 Feb 2024 12:09:01 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UFS storage support for Tensor/GS101?
Content-Language: en-US
To: William McVicker <willmcvicker@google.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com
References: <20240206034502.GA175333@sol.localdomain>
 <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>
 <20240207015234.GD35324@sol.localdomain> <ZcPGJo-NsOgZAQI5@google.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ZcPGJo-NsOgZAQI5@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/24 10:04, William McVicker wrote:
> I know you mentiond in the past that you looked into upstreaming the Pixel UFS
> driver but were blocked on it's dependencies. Have you had a chance to see what
> has landed for gs101 upstream thus far? It would be great if you could provide
> feedback on your findings! And please let us know if you're interested in
> collaborating with us on upstreaming the gs101 UFS bits.

The question about the dependencies should be answered by Samsung. They know
much more about the dependencies of the Exynos UFS driver than I do. I can
help with reviewing any patches they post.

Thanks,

Bart.

