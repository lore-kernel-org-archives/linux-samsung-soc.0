Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA9147044B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116678; cv=none; b=VJC48F5yDTdSs8Naw7YnAH0CWOvu7lZYcrnvvw8Q9ocF6vNG5mzBlqFav2yhlinN6scGOOMhW+9bXOrVcEyOs4cwu4z7W5/jWnX+rxB4TUBGOFEf9l8tbT62H7UaXLvb8OdSXVkJg7qWUfpruuV1GBPUFgFMDOOgnWIi+esM/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116678; c=relaxed/simple;
	bh=tvMysC/CeuoJ/SvvYgRXc3PRiPBy5Wp9M/28y1+/T4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID; b=sCYtY1gWI7vHIAWQCh/XQRQ3T1MkYPftqsQEfK5GMbc5XRfxL5qtiuaiJO0WiUPa24o7mPsKR1jDDFfhQsdVBqJigqNUQD+uv1h6+JHqR9Ohn4SPmr/xuR1qWzNS5oIMAdqKigVJdo1Bj9Yt1H/rf1u5BipRPsKVpq+mLV/N8E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N42uOVX3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N42uOVX3"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso506550a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116676; x=1789721476; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=N42uOVX34IwevujV8b8vitMWyTITmNuWdNhehkbE6IH+4ocLRxxyvjOf9+cyIYwiSB
         7yTNvsirYEvsYoVn84+iExMZ6o4zkV4QZqBEjjmfh7xK9mLinDbqq4LjJLEa7xfy2P11
         0GFGxjFClAqd++VfZMHi4aSFGH4XtyePh43dZWrYmFW93rpx1cTFnoBAkMaPq6E9LIlO
         TvbkPz7Ug0BuvPBkX7fTLXFPzHw32HV2NBBqWtCaWfdMFQE2Udfey7BKsk7xFgN9CrLG
         bkK29ZZCql+eJclK80JudkyKDkUhtZogiIP0oeWKaCVclx8q+p59mio2n5WJBDzeQeDQ
         /1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116676; x=1789721476;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=Y8Jg4p9FnOYRSktFqhMWmwwWEeUbdWEugIquqKf0Kf6lhDps8RxIE0oZfjjwhXu2mP
         NFfxdgZCjICjXqQZMDV5eq61pQ5pJsjWdqI14+PNHn59ujlvVh8ldsq4fC83KIaygUxW
         xi0VDj2ciqwhC9r7dtCr0M4whmNicMDsly2tbWonIhiGdCBEAvVJa+XeBmGINr58wJAF
         IT2VPqTL+xoG+V4JqDI+eZpzfzkwQxNTIiagKA+NSVPyjBPeVmzloIuS0kgqN23TqAtK
         z+V4iJgUsc/2lLH+CYeoNWm51XiRe1NAq35u2rqJmIubkMWYtFNrZwDplE6AHJXOHdCz
         ahsw==
X-Forwarded-Encrypted: i=1; AKwUvBzCXwyBZiml/QZyP+9ewcK1kH+lqLcCi2qOzUQwjCgeKqJIQjslDYFZW6b2hfRnTiURirmmEnV/meDMAdW8mLujQA==@vger.kernel.org
X-Gm-Message-State: AFuF++kfdp8v/LZUrC23cKjvqdnhAlWyhQ5oRUUi2s+fWKSg3ygKPkfI
	7JtrIAwur6ofYcwoDVl9Ppbr1JHF4kCRLg+mnZ4hIIIAZvzBrPUOXKcs
X-Gm-Gg: AYBFou1qoOkCJVUFPIMtxc6/webnLvVShR6gtxDCfA8VMwS2tXfLXfHebSfClnMkDwi
	al+z7YJD1KFww/hTTwvOxC9lzptW0AoPY8rXyCXAR1Lw1fQJktE4ExyneAjyCpLW91pHhEveGLY
	EajMHStoyvf45jvYvrNCJ2Lb8MkRPfTOWSxwwaHFQ+DeWi4w80Yj5KrpmaUc5pHkOxcZmUnyTnE
	cDZSH1EYDm/QWd83I8PpXkQqw/Z/GnXPzLLRihC6qnaZyY/bD2XUHgEstkallxu4Y8gou5npT+g
	EzgAoTt45rr/hw9vBffREjGScpIJzNoXiguLvnVGXF/KO5+QeOH6cV5TAKhvaxVEsTK4kSkrYGm
	ebVHE1kE65WXX5kv7AF7KEQVmCavmaOWD51GsVSWR5rqLzpapBJ35sAJ17uM+6cgK1J7FXPpv4W
	vc1KfB3veLX0+HTatW+2AluCjrNZVffjeeEX8nN9X5wA2ttUDo6YgPUMNUVTLySxUDU8uCufRdl
	o+k5btP4TZm5I1RzxZ+9ft0N4TcU3LN99dw
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr5993873a91.17.1789116675878;
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm4799895c88.13.2026.09.11.01.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Botsz HUANG <huang.botsz@gmail.com>, Nick Huang <sef1548@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
In-Reply-To: <20260910094326.GP2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
 <20260909161710.GG2133376@google.com>
 <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
 <20260910094326.GP2133376@google.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 Sep 2026 14:21:10 +0530
Message-ID: <178911667044.715443.13795127169435157424@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

On Thu, 10 Sep 2026, Lee Jones wrote:
> > Now, whether they should be Acked-by:ing patches is another issue
> > entirely!

I am the one who carried those two tags into v3, so let me take that part
off your hands.

I collected them the way b4 does, without knowing anything about either
person beyond the mail on the list, and I am in no position to vouch for
them.  I should not have respun the patch just to add them, which is what
v3 says it is for.

If it is useful I will send a v4 with both Acked-by trailers dropped,
keeping only Matti's Reviewed-by, which he gave after asking for the
"wainting" fix that v3 includes.  That way the patch does not depend on
how the wider question is settled.  Say the word and I will send it; or
if you would rather just apply v3 and strip the two trailers at commit
time, that works too and saves a round trip.

I will also drop the Assisted-by trailer naming the model while I am at
it, as has been asked of me elsewhere.

Thanks,
Hemanth

