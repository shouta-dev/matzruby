Ruby1.8.7p352 MBARI8 / RHEL6's patch
===

Overview
---

This ruby is a fork from [Ruby1.8.7p352 with MBARI8](https://github.com/brentr/matzruby/tree/v1_8_7_352-mbari).

This fork have been applied patches from RHEL6's SRPM.
* ftp://ftp.redhat.com/pub/redhat/linux/enterprise/6Client/en/os/SRPMS/ruby-1.8.7.352-13.el6.src.rpm

Detail of patches
---

### applied

```
# Patch23 is Fedora specific
Patch23:        ruby-multilib.patch
# Patch27 is not in the upstream VCS.
# This patch, while not technically required in the context of Rails,
# does seem like a useful addition: improved safety/compatibility:
#   http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/19399
# The rails side fix appeared in 2.0.5 and 2.1.2.
Patch27:        ruby-1.8.6-p287-CVE-2008-5189.patch
# Fedora specific
# Change the directory of sitearchdir from i?86 to i386 for upgrade path
Patch29:        ruby-always-use-i386.patch
# bug 428384, Fedora specific, however needed for Fedora's static
# archive policy
Patch33:        ruby-1.8.6-p383-mkmf-use-shared.patch

# Remove duplicate path entry
# bug 722887
Patch34:        ruby-1.8.7-p352-path-uniq.patch

# Avoid a false-positive test failure when $TERM is something like "xterm"
# that has certain capabilities.  Setting TERM=dumb ensures that readline's
# terminal-initialization code does not emit any escape sequence.
Patch40:        ruby-readline-TERM-dumb.patch

# Avoid segfault on PowerPC64.
Patch41:        ruby-ppc64-segv-fix.patch

# Ignore a minor gdbm-related failure.
Patch42:        ruby-skip-gdbm-test.patch

# Memory corruption in BigDecimal on 64bit platforms.
Patch45:        ruby-1.8.7-CVE-2011-0188.patch

# MD5 makes ruby interpreter crash in FIPS mode.
Patch46:        ruby-1.8.7-FIPS.patch

# mkconfig.rb: fix for continued lines.
# http://redmine.ruby-lang.org/issues/5189
Patch47:        ruby-1.8.7-p352-mkconfig.rb-fix-for-continued-lines.patch

# DoS (excessive CPU use) via hash meet-in-the-middle attacks (oCERT-2011-003).
Patch48:        ruby-1.8.7-p352-CVE-2011-4815.patch

# Segmentation fault during Marshal.load.
# http://bugs.ruby-lang.org/issues/4339
Patch49:        ruby-1.8.7-p358-marshal-load-segv-fix.patch

# Entity expansion DoS vulnerability in REXML
# bug 914716
Patch50:        ruby-2.0.0-entity-expansion-DoS-vulnerability-in-REXML.patch
# Fix regression introduced by original patch for 914716
# https://bugs.ruby-lang.org/issues/7961
Patch51:        ruby-2.0.0-add-missing-rexml-require.patch

# $SAFE escaping vulnerability about Exception#to_s / NameError#to_s
# CVE-2012-4481
Patch52:        ruby-1.8.7-p371-CVE-2012-4481.patch

# hostname check bypassing vulnerability in SSL client.
# CVE-2013-4073
Patch53:        ruby-1.8.7-p374-CVE-2013-4073-fix-hostname-verification.patch

# Fix regression introduced by CVE-2013-4073
# https://bugs.ruby-lang.org/issues/8575
Patch54:        ruby-2.0.0-p255-Fix-SSL-client-connection-crash-for-SAN-marked-critical.patch

# OpenSSL 1.0.1 requires longer RSA key.
# http://bugs.ruby-lang.org/issues/6221
Patch55:        ruby-1.9.3-p222-generate-1024-bits-RSA-key-instead-of-512-bits.patch

# CVE-2013-4164: Heap Overflow in Floating Point Parsing
Patch56:        ruby-1.9.3-p484-CVE-2013-4164-ignore-too-long-fraction-part-which-does-not-affect-the-result.patch
```

### NOT applied

```
Patch100:       ruby-1.8.7-lib-paths.patch
Patch300:       dtrace-ruby187.patch
Patch301:       dtrace-ruby187-bretm.patch
```


Thank you !!

