From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RFC alternative ver 1] phy: Exynos 421x USB 2.0 PHY support
Date: Mon, 6 Jan 2014 15:54:28 +0530
Message-ID: <52CA845C.5080308@ti.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com> <1387545857-9472-11-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387545857-9472-11-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 20 December 2013 06:54 PM, Kamil Debski wrote:
> This the alternative version of the support for Exynos 421x USB 2.0 PHY
> in the Generic PHY framework. In this version the support for Exynos
> 4210 and 4212 was joined into one file.
>
> Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Hi,
>
> Me and Kishon were discussing for quite a long time the way how Exynos 4
> should be handled. I have decided to post the original patches and try
> to make an alternative version with support for Exynos 4210 and 4212 joined
> in one file. I have prepared two versions. The first one has 506 lines (vs
> 563 when two files are used). When doing the second version I was a little
> more aggresive in removing code. This was done at a cost of adding if's
> deciding which SoC version the driver is dealing with in some internal functions.
> This resulted in a better number of removed lines - the second version has
> only 452 lines (vs 563 original and 506 version 1).

Alright.. If the alternate approach doesn't give too much of advantage, 
lets stick with the original one. I would recommend creating a 
documentation (Documentation/phy/?) for the samsung PHY since that 
actually creates a layer on top of generic PHY framework. That would 
help while adding new samsung PHY drivers.

Btw thank you for preparing alternate versions for your original patches.

Cheers
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
