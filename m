Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0A2F2C56
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661023; cv=none; b=PctQujEDYFT35rAMJKePnAJQ0lxUc636r7VZpF0YjUCDBWoM413Y57vO+89RNQDM+1EROleva70yzqiUOe+raigDzU+Cp3tq3bfmpkBMbtQSjYux3Lqt0xMUugWiEm+Guzc0/F9wVc8wT/BdxEEyX0GP3MQicLKnQUrD5zVQfYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661023; c=relaxed/simple;
	bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nA+7kCxmuyTsTJpmU0JEmZy1akWGafNc7ZQS9xjwzz6N+X5cwTj9hWdwT0sEZPCLTbNaN3da6zPbJBNQokrzh1TI+GL6UY6ZPMfEmvkYgxOO0VWFuHTPRRymi3ISVFyCHP5k0jgGufZVFRZhAPNbA8neJuk1pDBX6oRz7eMIlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnKajPBD; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnKajPBD"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ff1ed124deso2331970fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2025 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661020; x=1753265820; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=;
        b=vnKajPBDLQoJuBu1wcoh4+9baoAfoU5a+icFk2HgcdAex4DqZ9wDHfdX+9M36A1kiW
         SzKTA/rZxtjh2QTarg7+OnKAE9QI8tLwAxlNs1pxxf6WX7MiwN/2KbVJzcNDfaaDrlMD
         KXy5fxIr25qFFDMjYmowwwazpUkLadav/fkNKIS4lsB6sRp+cnOVOt57e8rAmFNDNTN2
         60nGYg0+S4FGRZm/Q5bpSpQOwlkimsVoZ2WPAiW3KbVKylmEqIG6A/9kqftOcuXhE+xt
         BKnHsj4F85pQBDLzPvG4sJdIWqNGKBO2ed3TRdfGxj8GuBxTcIzXfZdowU4Xv16/VW9X
         mukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661020; x=1753265820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=;
        b=uiWobzIpmZaDpOWWmEPTI6WKaKxg1Y8fBtV9Feg1q7EZ3pa9970vAlgnI/qgu02OsQ
         7o+ffT4zv3DkthEUo9YPa/Hdr2fTqSgwATy9zue7gskTLRX1kTOp8QHxiLkb9EjpK3Mb
         pEbzKSgWgrvGDuDrLOuA4x8o1jj3CpT3H8u2OP+xXi+yJfH5sqjqnwtnqb9+WrKsMfHs
         6xVcgDwN82mDjl7peuLmGLTMxU7bGi/houfYQqNdLIiSeLxB4Sn/77Pv+3i8S476fKSb
         dDh/+1uB6Tf/QPMWGftMFp740F/6VW8itoiickjmY4SDt9wKMRS0qjic8jIAk4JMxSB0
         oKow==
X-Forwarded-Encrypted: i=1; AJvYcCUc0RznObl+7jimlptgJuJUIKSDSHrb2QWa7boiU6HSrXjRMnvSSTe9rWIofx37CoxYn/gNaRZh1K3C3lFDY69JSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhELkMTUdzAc8syE6ro2WQjLtGjtQFEGEgpL/nahy2vpMO19it
	YIfSemRKkwNbwra6E/DeHtzimJ1om1TV0ZlYMSrgB0qGbLKX9GsKNId5gYxNVvcU5PEkrmzcg03
	stP7gCdqQiiHyURm9xC5jDQiE8CNsV7yRmypPpD/xZA==
X-Gm-Gg: ASbGncu8S28U/urZQThGkimjZ0043KV1//9eyVDDHX4cd+kYu2jRERG+hUAiXg1YINK
	usURhoRKxAFi2ahVNyFzMaobC3YfCSMLUVZ4EmRmJweYywh9EoZnkS9HFpYgj4iJPbK3s9v80cZ
	b6J0eziLILqT0MDraN+DhIgUmbe6qmuReshBGn+j/gX/IXWaQ0tTlqyy7k7GZ92tSxVUuMvZWEo
	FcdCEgD
X-Google-Smtp-Source: AGHT+IFBJVxKAXo/cKR2ndkM9X7Bsz8i7y0trbE2KS4VktpXvhySzwMgUoWrnTeCkvYzPODvF62WRFigY53HbadClC8=
X-Received: by 2002:a05:6871:71f:b0:2eb:a8fb:8622 with SMTP id
 586e51a60fabf-2ffb229c270mr1371804fac.15.1752661020506; Wed, 16 Jul 2025
 03:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
 <yq11pqiaedd.fsf@ca-mkp.ca.oracle.com> <yq1a556776b.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1a556776b.fsf@ca-mkp.ca.oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 16 Jul 2025 11:16:49 +0100
X-Gm-Features: Ac12FXyVvVETCy_fvebhSLHtpuQY_pd3_d6Vt5LZcabX59ifAwOETZg6eR50R8Q
Message-ID: <CADrjBPrCBG4ZatLwYyH07f5EQrbO876M7WqXX7UfgD9Cg8w9Uw@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: call phy_notify_pmstate() from hibern8 callbacks
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Vinod Koul <vkoul@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

+ Vinod (phy maintainer)

On Mon, 14 Jul 2025 at 23:15, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> >> Notify the ufs phy of the hibern8 link state so that it can program the
> >> appropriate values.
> >
> > Applied to 6.17/scsi-staging, thanks!
>
> This appears to have a dependency on a patch series aimed at the phy
> tree.

Thanks for your email. Yes you're correct, as mentioned after the ---
in the patch this has a dependency on the new API proposed in [1] so
can't be queued currently.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org/
