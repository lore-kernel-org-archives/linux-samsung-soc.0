From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: dts: update macros in clock bindings for
 exynos5420
Date: Tue, 15 Apr 2014 20:01:48 +0200
Message-ID: <534D740C.2060904@gmail.com>
References: <1395918470-16374-1-git-send-email-shaik.ameer@samsung.com> <1395918470-16374-8-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395918470-16374-8-git-send-email-shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Shaik,

On 27.03.2014 12:07, Shaik Ameer Basha wrote:
> From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> This patch updates the macros as per the latest changes and
> replaces magic numbers with macros defined in DT header for
> exynos5420.
>

Contents of dts files are not "bindings", they are just device tree 
sources/data, defined according to some bindings. Bindings are defined 
sets of nodes and properties and their formats, as you can see in 
Documentation/devicetree/bindings/, where documentation of supported 
bindings is available.

So this patch doesn't update clock bindings, but rather device nodes. 
Following would be more appropriate: "ARM: dts: update clock IDs in 
device tree of Exynos5420".

However, as mentioned in comments to previous patches, most (if not all) 
of the changes below could be probably dropped.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
