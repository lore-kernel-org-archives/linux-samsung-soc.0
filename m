Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82124146D65
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363577; cv=none; b=fC59EJoQ8awGamGrXX5HcUIENyGOCcIRTNrPw8QBB+WM/bhTDmR+dEYpSLghHlS46LSAVYjiNQHb7n/oapu15HgG+E8/iwm5kpSHOR0RJTXprPcG+/9yuTrBIodMMqPbcf/6TKHdNvoU7WVqULGf7xy8xjOrnfvKGWQkUxWYqgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363577; c=relaxed/simple;
	bh=nhBrdpGUSLHyrAAXb3qGBS0O6/3Kdpdye6wtcGmaFhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfvOyl22Z9kZZL587RfskX6nppAgDpmJpS6lxMs3BJwWX8ERsI3bui5rCHW3hmAPl4LMzGW/Uq7Lxf/f4J1rGwPB6l9lvyKWlz0ro+VK4UdJnVzGVa4dgxTSP6PpGSe8DEDfWbsIBMt1b726MdrZ+ufJI7GNegEqC0BkrLvAsEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AR57AWEY; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AR57AWEY"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3a189af49fso2611995276.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734363573; x=1734968373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
        b=AR57AWEYcvVkGfj7Q3dJe19K0r7Ur6UCsm84y6YqpR6+ZGivin5QXqyTm4PD+jU/RV
         uwx/+DikPjYsAbXtg4YYmCrHM5A02WVhnIT4PxDSRYC9XyjFgCqj1zOtiKUVMYh1Mv28
         2znIT94pKab1sJ5MVkEUM8B4FSVgeQdl1NfZLOzcoyCsIysVDwzBOcmfCPmz0cpFZERX
         +eDpyD77aj2bC6NTbY2f2b6UbBYEkPc6nNMxZdeoTdjXRFynxda89BDPv3MBiqH4HgLh
         ALU+ln162edclNcGXkCV8pjGo+Kmauurbs+9Z095IVC0jM/FlzEEzWE4G9Zudjc+Gl0q
         lLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363573; x=1734968373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
        b=LdZFu0eqVzmTRimZFGJwTlb29RSox836YZVyt/jhTyA3hNgD92iU+o9G+uVeEhtMRa
         2tdznpF+7oTlU2QM60DDNhfKRc0111ChCtyuLxjScchDTJTmHjK1yg35KquRqwB/096i
         R8nr4vWhz0xm+aFHX5tdBpOolRq2RCzzYECHnBYB2rD2Hia/ZzX4NyX6wHQHoxZfTt9Z
         rsVfmn0/smVQdadAS6NQ9ONXFg/SHyvInPJlFqU4m7e7sHoYmbmBK8M6AZN+EA5LVhvk
         E2KwL8xCJuZuSftNMUH5KwWy1K9lGVOaemu1GWs5FguCUUsHoRVZ/2vI/MX+MWVXrLox
         n9AA==
X-Forwarded-Encrypted: i=1; AJvYcCXF6WakfapH4fWPzM2vjwFVB4bPv10QjxdpLsAqV/g0MRcFK34MLh0yNWgkcAPnIb31srXMNkD9I5bhYk//IccFRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxINXXM5De7GhghOb270Pxe2Bd8idWEu5Wybt+haWSybGnlHmWe
	rYy1G75hRdStuRxBqKArbo56Zwkhpyhhv9tDwtKNtEJiUEt+khCrZavw/YmjLceRjj56LAGzwr7
	Y2sdLScFiRYpBqFdRyLjnjgC2JKKOe7FH3HpclA==
X-Gm-Gg: ASbGncueYS7TALJTSWBWUFwiODfm0c+wL5J1t8K2v+DUxdLuFZfMQmaFmo95BBr3g6X
	bQF5Ovfy/b3nTy9A6iXhCMu8YFRYdDzLrXXJLu04HScCsvxHmGYpk
X-Google-Smtp-Source: AGHT+IG+H16BKk2N9qAAZI58ZkiAMWnWq2KJ5i2xrkWhHJZG86PFBQyzzbHk+XT6vSRTQXHuY/aP5XO15EqLEv61aT4=
X-Received: by 2002:a05:6902:70b:b0:e33:1096:f2e1 with SMTP id
 3f1490d57ef6-e434fd23319mr9276225276.40.1734363573390; Mon, 16 Dec 2024
 07:39:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com> <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
 <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
In-Reply-To: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 17:39:22 +0200
Message-ID: <CAA8EJpqYs92T9x3omDa5XR21GC04Kcc75eVRr6w3pt0W7qPX-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Dec 2024 at 17:32, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> w=
rote:
> > >
> > >
> > >
> > > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > > >> Reading access to connector->eld can happen at the same time the
> > > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex=
 in
> > > >> order to protect connector->eld from concurrent access.
> > > >>
> > > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >
> > > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this =
one
> > > > and to the radeon patches? I'd like to be able to pick the series f=
or
> > > > drm-misc and these two are not reviewed by you.
> > > >
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce96=
47f0606fb86fe57f347639 100644
> > > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_el=
d(struct device *kdev, int port,
> > > >>                      continue;
> > > >>
> > > >>              *enabled =3D true;
> > > >> +            mutex_lock(&connector->eld_mutex);
> > > >>              ret =3D drm_eld_size(connector->eld);
> > > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > > >> +            mutex_unlock(&connector->eld_mutex);
> > >
> > > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > > be safer to modify the audio_lock mutex so it only guards the
> > > aconnector->audio_inst access.
> > >
> > > But I don't see any way these mutexes would otherwise interact,
> > > so this change should be good as-is.
> > >
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> > Would you ack it to merge it through drm-misc? Or would you prefer to
> > pick up those two patches after merging drm-misc-next once the rest of
> > the series lands?
>
> Merging through drm-misc is fine with me.

Thanks!

>
> Thanks,
>
> Alex
>
> >
> > >
> > > Harry
> > >
> > > >>
> > > >>              break;
> > > >>      }
> > > >>
> > > >> --
> > > >> 2.39.5
> > > >>
> > > >
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
