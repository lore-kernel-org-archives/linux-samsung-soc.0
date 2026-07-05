Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB43285C8B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2026 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238061; cv=pass; b=eGoa+07yvAgSPovm8iDAL7HzLtOhdfMWQChFW+lX2vv1w0zHQjoaoKXSF3P1eGhGLez+Vb224x8fmrFJenw8Vg0aRfrQMZAoR6cIEEDncyVdIV8M8SJ5sICY0ATjME3r/lSVxuiMIF07lqDjxIJcWfXD/V0AVQYDgXixiB9yjwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238061; c=relaxed/simple;
	bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmIGcf5wzQz6HCm+DQSErW+bZPPmURcT5i03U6YtyS+rVd1/zZoDFxrN3DA4tA8o6dAfR8nzA+JfePRMpV90oYlwEf9c9BS1nOlBhzQ4phHBK6p485yyWYVaWmw7AWnBuQbg1zHsGhZE+JoUxqOwBF7BkMkCSjrD9JjJRBfBkpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J56VlaR8; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J56VlaR8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1668643a34.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jul 2026 00:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783238049; cv=none;
        d=google.com; s=arc-20260327;
        b=gtZXTXizXXDgCSx0zOx4Jb9gs4w+2aHMCAoWqqkE7+MSyacbKCdS6S5hq9Lmh25MBH
         4yYANckWweg29KpYjfTuKQHidV5oHxdq/TjYBYzkd7SoO6oAPedkSSH8UIrCBNwu5Qx6
         JyofFNF7AcQMiqvNOwsxwRfRY0WNJCAXJLx/dZt3uNfa3OxgLkHzKKh7lHgGe6Uxr00u
         dOYP3GYTcDvPC+F/VOn9lkXaeqInLloqZiUReVWChMSTsiOk4ZmlK+857EEgB9w9WCyW
         I1W4Q6vsPBP7csQjvaqYlLS3hSZl25Ay9wdCl1hk13bKC5U3xwcvMFiPsfKmnI+GLgbx
         eKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        fh=9pyzM9hG7EQtsSIWf3wol3fImpKnTLZ4YsqFVxaQWd4=;
        b=c7XY2Aakg1/6P90l4MYxwssrcpNmPIxfRYONlT8brlfmOP1yuEbb+gP499Bdxe1eYR
         lYtFPpLtJJY5yer8BdG1/2nbCFdBnmhT1Fg5+1Pxb4F3WSRmHApnas1akAMrxaUJqF1G
         fVniFRt+ChuIP5Ld2WEKmvS8B9/bwmzGbLiGfqQWXceX7wJqD6Z3GnxJ1ZqT6Lw1TR5r
         Pm56OHiS1fDFBNbBfDSPGZGkb0zOfOF5rTQvM+8Udd4AvnI/FVLjiyjiBgU3MSVXjTEJ
         chtfqHJzbTnerUcs29LpnUrFxdwTiO3fFiDtlVoCP8AMla7a7NZnp/+d9di7KWR+C9Av
         nc8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238049; x=1783842849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        b=J56VlaR8RhE+YcCtVSETDuSVpHK45BGLJZ69DJz56GGMQCJJUxyvhv1yE29/JVsGhO
         E3PlY3lGmlBD7Mi55nqRn7ZyPX34oqg975b0DE+k5nB6Q5QXY/LZ6++fDYFhcNoVDrq6
         XuqtoCnjluiCie0/67kb/ZfCFZ6xQzj4A2L0Jg7ccCERbtF/Tj/DxoeIyZqNPpwvx6fK
         iOOqtvFY7/d8npHnyWIN0MR0cIN+5MGiMtrYXRhhX1sZcNEXvkko4JDvUYnkP1kJWTeX
         KsttyyVrcV99g8minsV90A3Fs3C9Rqykf44FW8IuzUevvy2PH4CmL45dJFdCnRsCp65K
         ePHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238049; x=1783842849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        b=a9ZSPoR8nOY16dx0ttbwJkJFJNIuwpU+jqY2r7DH9oGDtGGh7lfMmoVdNvNApRiaLw
         iTV684hwBshBNy7r2h010rQ9xqnwRxlFZqUrOaJjCVnSXO2cGj9Q8kqmSuLAby7A28vY
         Kax/JoLsm7anQBiJXtppVWKM9ffx/8yWq5/CLqtqVyPHJdhC0WMxIHA/VYdOmGmBvnKr
         xK6I5OJK2z91zcc5MvEzpTzOKsa/pwkCSDlx2vC4YqpiDT/7LgCX2nKvsSKDi+MX+iuj
         1tzdQC/nEOiB95872Ki3Jdw18BRqG/pzVqZzte/Be/xymqq6/9FxnRBZgOM5Qcqm9yPw
         CIXg==
X-Forwarded-Encrypted: i=1; AFNElJ+qZ4Imq/RWj+235ePQXdKHCVSOqR8YmDzlOf696Ln2nvfECF1f/n7znKP5L/8yusn87/UdeHs/ifaTtZzMRNZSyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwutemUzBqeea0EmjYt2cFlwRTHOGW3cOL6K+8Xv6kBqkjlLM45
	9+M4NFenV940r3Udm17VvmTvc1OfJruWAyKJQrzdmyRPZaJ74P0YjMQ/a4d3jBwNQxwscyaDlbo
	iAwED/MNPTrPzqdbEQOfUPcW/a1NBeyY=
X-Gm-Gg: AfdE7ckehkJH1mtAxhTtiFkpYaqJoeOCSOtQVXMVf1EirfpPvJCUScpKQS46flOZYCF
	5Y8K534cHafqonsVI/ZTQJxOWoW13TXZ0a+XMeD34rcpecOcwNEGdR5myb6y+FO/XHBaFnmae3Y
	wCE6qHODD+Vud0j5T6OMrqjjrpkCEz1lMh5ruq7VxqVfid9tzBM4SaUFyp2tZJrJoYvTnsBuuEs
	q8lASJHQehmzT+FJSAg7wOZkw+YCTXfqucOYBRRlAGpN2Duk+QYbX1t8TVSfxHe5Xw1s37i0vme
	vwxglPVr
X-Received: by 2002:a05:6830:c0b:b0:7eb:6891:c372 with SMTP id
 46e09a7af769-7eb7fd44f08mr3780839a34.13.1783238049452; Sun, 05 Jul 2026
 00:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com> <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
In-Reply-To: <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 5 Jul 2026 09:53:55 +0200
X-Gm-Features: AVVi8Cei8vAjqwK5-A1ihBt88FWQH6IBM5O7QlOt3ukYNuXYArJIbJae9dKPeOY
Message-ID: <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Inki Dae <daeinki@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Inki,

> It looks like you may have forgotten to post the v2 patch. Could you
> please check?

I think they are here:
https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-1-a8d59678b7d2@gmail.com/
https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-2-a8d59678b7d2@gmail.com/

If I did something wrong tell me and I will re-send them.

Thanks,
Diogo
