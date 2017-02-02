From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on TM2 board
Date: Thu, 02 Feb 2017 17:30:34 +0200
Message-ID: <871svgzk2t.fsf@intel.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com> <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com> <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com> <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com> <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec> <20170131143853.GU20076@art_vandelay> <20170131150226.GB4519@ulmo.ba.sec> <87r33j85ap.fsf@eliezer.anholt.net> <20170131213132.GC872@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131213132.GC872-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 31 Jan 2017, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
>> I would love for drm-panel to be moved under -misc.
>
> Like that's going to magically motivate people to spend their time
> reviewing other patches. The only thing that group maintainership adds
> is redundancy.

Adding redundancy is not an insignificant thing. I think it can be quite
liberating to not have everything and everybody depend on you. You can
defer to others when you're busy, tired, sick, whatever. Things still
move on.

And I don't think redundancy is the only thing that group maintainership
adds. You'll have maintainers that complement each other, with different
skill sets and abilities and experience. They don't all look at the same
things. As maintainers tend to be more senior folks, I find sharing the
load of the more mundane tasks of maintainership free up their time to
contribute more of their technical skills to the project, for example
review.

It's just my personal view on i915, but I think people take more
responsibility of their own work, instead of just sending patches and
waiting for stuff to happen, when they have commit access. But you have
to trust the people.

I didn't intend for this to become a kind of sales pitch, but I do think
drm-panel would be a good fit for drm-misc. Personally I think it's your
call, but I think you should think about it. (And that decision should,
obviously, be made calmly, independent of any particular patch series.)


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
